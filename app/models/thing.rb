class Thing < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

	has_many :photos

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	has_many :feelings, dependent: :destroy
	has_many :fanciers, dependent: :destroy
	has_many :owners, dependent: :destroy
	has_many :reviews, dependent: :destroy

	has_many :list_things, dependent: :destroy
	has_many :lists, through: :list_things

	validates :title, presence: true
	validate :thing_photos

	def to_param
		"#{self.id}-#{PinYin.of_string(self.title).to_s.parameterize}"
	end

	def page_title
		p_title = self.title
    p_title = "#{p_title} - #{self.subtitle}" unless self.subtitle.empty?
    p_title
	end

	def page_title_feelings
		"#{page_title} - 短评"
	end

	def page_title_reviews
		"#{page_title} - 评测"
	end

	def self.new_by_publish(params, publish)
		thing = self.new(params)
		thing.publish = publish		
    thing.fancier_count = 0
    thing.owner_count = 0
    thing
	end

	def self.new_by_hash(hash)
		thing = self.new
		thing.token = SecureRandom.hex
		thing.title = hash[:title]
		thing.subtitle = hash[:subtitle]
		thing.body = self.processed_body(hash[:body])
		thing.official_site = hash[:official_site]
		thing.publish = false
		hash[:photos].each do |photo|
			p = Photo.new_by_url(thing.token, photo)
			p.save
			thing.photos << p
		end
		thing
	end

	def update_attributes_with_publish(params, publish)
		self.publish = publish
		self.update_attributes(params)
	end

	def save_with_photos
		result = self.save
		Photo.by_token(@thing.token).update_all(thing_id: self.id) if result
		result
	end

	def add_or_remove_fancier(user)
		if self.fanciers.by_user(user.id).exists?
			self.fanciers.by_user(user.id).first.destroy
			self.fancier_count = self.fanciers.count
			self.save
			'removeok'
		else
			self.fanciers << user.fanciers.build
			self.fancier_count = self.fanciers.count
			self.save ? 'ok' : 'error'
		end
	end

	def add_or_remove_owner(user)
		if self.owners.by_user(user.id).exists?
			self.owners.by_user(user.id).first.destroy
			self.owner_count = self.owners.count
			self.save
			'removeok'
		else
			self.owners << user.owners.build
			self.owner_count = self.owners.count
			self.save ? 'ok' : 'error'
		end
	end

	def add_hit
		self.hits ||= 0
		self.hits = self.hits + 1
		self.save
	end

	private

	def thing_photos
		errors[:photos] << "产品图片不能为空" unless (Photo.by_token(self.token).exists? || self.photos.count > 0)
	end

	def self.processed_body(body)
		#从body中取出所有图片链接，调用save_remote_img(url)方法保存到本地，并将更新地址后的body返回
		page = Nokogiri::HTML(body)
		page.css('img').each do |img|
			#img_url = img[:src].gsub! '!review', ''
			img_url = img[:src]
			#img[:src] = save_remote_img(img_url)
			#body.gsub! "#{img_url}!review", save_remote_img(img[:src].gsub! '!review', '')
			body.gsub! "#{img_url}", self.save_remote_img(img_url)
		end
		body
	end

	def self.save_remote_img(url)
		ym = DateTime.now.strftime('%Y%m')
		dir = Rails.root.join('public', 'uploads', 'body_img', ym)		
		Dir.mkdir(dir) unless File.exists?(dir)

		basename = File.basename(url).gsub! '!review', ''

		#body中的图片保存到本地
		newfile = Rails.root.join('public', 'uploads', 'body_img', ym, basename)
		File.open(newfile, 'wb') { |f| f.write(open(url).read) }
		#"/uploads/body_img/#{ym}/#{basename}"

		#body中的图片保存到upyun
		upyun = Upyun::Rest.new('xinqidou', 'xinqidou', 'macnmq1983', {}, Upyun::ED_AUTO)
		result = upyun.put("/uploads/body_img/#{ym}/#{basename}", File.new(newfile, 'rb'))
		#result = upyun.upload(File.new(newfile))
		if result
			File.delete(newfile)
			"http://image.xinqidou.com/uploads/body_img/#{ym}/#{basename}"
		else
			"/uploads/body_img/#{ym}/#{basename}"
		end
	end
end
