class UserFollower < ActiveRecord::Base	
	belongs_to :following, :foreign_key => :user_id, :primary_key => :id, :class_name => 'User'
	belongs_to :follower, :foreign_key => :follower_id, :primary_key => :id, :class_name => 'User'
end
