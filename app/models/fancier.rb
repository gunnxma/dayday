class Fancier < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user

	scope :by_user, ->(user_id) { where("user_id = ?", user_id) }
end
