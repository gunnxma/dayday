module Likeable
	extend ActiveSupport::Concern

	included do
		has_many :likes, as: :likeable, dependent: :destroy
	end

	def liked_by_user?(user)
		return !self.likes.where('user_id = ?', user.id).empty?
	end
end