class Photo < ActiveRecord::Base
	belongs_to :thing
	mount_uploader :avatar, PhotoUploader

	scope :by_token, ->(token) { where("token = ?", token) }

	def self.new_by_url(token, url)
		photo = self.new
		photo.token = token
		photo.remote_avatar_url = url
		photo
	end
end
