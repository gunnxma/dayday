class ThingsController < ApplicationController
	before_filter :check_user
	before_filter :check_power, :only => [:edit, :update, :destroy]

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

	def destroy
		@thing.destroy
		redirect_to '/'
	end

	private

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
