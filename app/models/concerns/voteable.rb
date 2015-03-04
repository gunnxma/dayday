module Voteable
	extend ActiveSupport::Concern

	included do
		has_many :votes, as: :voteable, dependent: :destroy
	end

	def voted_by_user?(user)
		return !self.votes.where('user_id = ?', user.id).empty?
	end
end