class ThingsController < ApplicationController
	before_filter :check_user, :only => [:new, :create]
	before_filter :check_power, :only => [:edit, :update, :destroy]
	skip_before_filter :verify_authenticity_token, :only => [:crawler]

	def new
		@thing = Thing.new
		@thing.token = SecureRandom.hex
	end

	def create
		@thing = Thing.new(thing_params)
		@thing.publish = false
		@thing.user_id = current_user.id
		if @thing.title.empty? || !Photo.where('token = ?', @thing.token).any?
			flash[:notice] = '请将必填项填写完整'
			render 'new'
			return
		end
		if @thing.save
			Photo.where('token = ?', @thing.token).update_all(thing_id: @thing.id)
			if params[:commit] == '保存'
				flash[:notice] = '产品保存成功'
				redirect_to edit_thing_path(@thing)
			else
				@thing.publish = true
				@thing.save
				redirect_to thing_path(@thing)
			end
		else
			flash[:notice] = '产品保存失败'
			render 'new'
		end
	end

	def edit		
		
	end

	def update
		if @thing.update_attributes(thing_params)
			if params[:commit] == '保存'
				flash[:notice] = '产品修改成功'
				redirect_to edit_thing_path(@thing)
			else
				if !@thing.publish
					@thing.publish = true
					@thing.save
				end
				redirect_to thing_path(@thing)
			end
		else
			flash[:notice] = '产品修改失败'
			render 'edit'
		end
	end

	def show
		@thing = Thing.find(params[:id])
	end

	def destroy
		@thing.destroy
		redirect_to '/'
	end

	def crawler
		url = params[:url]

		thing_hash = {}

		thing_hash = tmall_crawler(url) if url.include? "tmall.com"
		thing_hash = knewone_crawler(url) if url.include? "knewone.com"

		if thing_hash.empty?
			render :text => 'error'
		else
			thing = Thing.new
			thing.token = SecureRandom.hex
			thing.title = thing_hash[:title]
			thing.subtitle = thing_hash[:subtitle]
			thing.body = thing_hash[:body]
			thing.official_site = thing_hash[:official_site]
			thing.publish = false
			thing.user_id = current_user.id
			thing.save
			thing_hash[:photos].each do |photo|
				t_photo = Photo.new
				t_photo.thing_id = thing.id
				t_photo.token = thing.token
				t_photo.remote_avatar_url = photo
				t_photo.save
			end
			render :text => thing.id
		end
	end

	private

	def tmall_crawler(url)
		page = Nokogiri::HTML(open(url))
		hash = { 
			title: page.css('title').text,
			subtitle: '',
			photos: [page.css('img#J_ImgBooth').first['src']],
			body: '',
			official_site: url
		}
		
		hash = {} if hash[:title].empty? || hash[:photos].empty?

		hash
	end

	def knewone_crawler(url)
		page = Nokogiri::HTML(open(url))
		photos = []
		page.css('div[class="carousel carousel--extend"] ul li img').each do |photo|
			photos << (photo['src'].gsub! '!middle', '')
		end
		hash = { 
			title: page.css('div#thing_title h1 a').text,
			subtitle: page.css('div#thing_title h2').text,
			photos: photos,
			body: page.css('div[class="body post_content is_folded"] p').to_s,
			official_site: page.css('a[class="official_site"]').first['href']
		}
		
		hash = {} if hash[:title].empty? || hash[:photos].empty?

		hash
	end

	def check_power
		@thing = Thing.find(params[:id])

		if @thing.user_id != current_user.id
			redirect_to '/'
			return
		end
	end

	def thing_params
    params.require(:thing).permit(:title, :token, :subtitle, :official_site, :body)
  end
end
