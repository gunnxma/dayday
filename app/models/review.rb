class Review < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user
	has_many :review_ups
	has_many :rfeelings

	def page_title
    p_title = "#{title} - #{thing.title}"
    p_title
	end
end
