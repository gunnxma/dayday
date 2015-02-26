class Lfancier < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
	belongs_to :list
	belongs_to :user

	scope :by_user, ->(user_id) { where("user_id = ?", user_id) }
end
