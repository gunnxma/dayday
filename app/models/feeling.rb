class Feeling < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user

	validates :body, length: { maximum: 140 }, presence: true
end
