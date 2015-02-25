class Lfancier < ActiveRecord::Base
	belongs_to :list
	belongs_to :user

	scope :by_user, ->(user_id) { where("user_id = ?", user_id) }
end
