class User < ActiveRecord::Base
	mount_uploader :avatar, UserUploader
	has_many :things

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
	end
end
