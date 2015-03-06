class User < ActiveRecord::Base
	mount_uploader :avatar, PhotoUploader
	has_many :things, dependent: :destroy
	has_many :feelings, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :lists, dependent: :destroy
	has_many :votes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :owns, dependent: :destroy

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

	# 赞
  def vote(voteable)
    return false if voteable.blank?
    return false if voteable.voted_by_user?(self)
    self.votes.create(voteable_id: voteable.id, voteable_type: voteable.class.to_s)
    voteable.touch
  end

  # 取消赞
  def unvote(voteable)
    return false if voteable.blank?
    return false if not voteable.voted_by_user?(self)
    vote = self.votes.where('voteable_id = ? and voteable_type = ?', voteable.id, voteable.class.to_s).first
    vote.destroy
    voteable.touch
  end

  # 喜欢
  def like(likeable)
    return false if likeable.blank?
    return false if likeable.liked_by_user?(self)
    self.likes.create(likeable_id: likeable.id, likeable_type: likeable.class.to_s)
    likeable.touch
  end

  # 取消喜欢
  def unlike(likeable)
    return false if likeable.blank?
    return false if not likeable.liked_by_user?(self)
    like = self.likes.where('likeable_id = ? and likeable_type = ?', likeable.id, likeable.class.to_s).first
    like.destroy
    likeable.touch
  end

  # 拥有
  def own(ownable)
    return false if ownable.blank?
    return false if ownable.owned_by_user?(self)
    self.owns.create(thing_id: ownable.id)
    ownable.touch
  end

  # 取消拥有
  def unown(ownable)
    return false if ownable.blank?
    return false if not ownable.owned_by_user?(self)
    own = self.owns.where('thing_id = ?', ownable.id).first
    own.destroy
    ownable.touch
  end
end
