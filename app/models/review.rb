class Review < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user
	has_many :review_ups
end
