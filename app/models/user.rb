class User < ActiveRecord::Base
	mount_uploader :avatar, PhotoUploader
	has_many :things
	has_many :feelings
	has_many :feeling_ups
	has_many :reviews
	has_many :review_ups

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
	end
end
