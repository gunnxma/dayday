class User < ActiveRecord::Base
	mount_uploader :avatar, PhotoUploader
	has_many :things, dependent: :destroy
	has_many :fanciers, dependent: :destroy
	has_many :owners, dependent: :destroy
	has_many :feelings, dependent: :destroy
	has_many :feeling_ups, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :review_ups, dependent: :destroy
	has_many :rfeelings, dependent: :destroy
	has_many :lists, dependent: :destroy
	has_many :lfanciers, dependent: :destroy
	has_many :lfeelings, dependent: :destroy

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

	def followed_by_user?(user)
		return false if user.blank?
		return self.followers.include?(user)
	end
end
