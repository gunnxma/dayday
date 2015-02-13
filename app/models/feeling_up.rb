class FeelingUp < ActiveRecord::Base
	belongs_to :feeling
	belongs_to :user

	scope :by_user, ->(user_id) { where("user_id = ?", user_id) }
end
