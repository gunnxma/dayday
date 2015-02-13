class User < ActiveRecord::Base
	mount_uploader :avatar, PhotoUploader
	has_many :things
	has_many :fanciers
	has_many :owners
	has_many :feelings
	has_many :feeling_ups
	has_many :reviews
	has_many :review_ups
	has_many :rfeelings

  has_many :user_followers, :foreign_key => :user_id, :class_name => 'UserFollower'
	has_many :followers, :through => :user_followers
  has_many :user_followings, :foreign_key => :follower_id, :class_name => 'UserFollower'
  has_many :followings, :through => :user_followings

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
	end
end
