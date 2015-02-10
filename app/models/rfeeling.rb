class Rfeeling < ActiveRecord::Base
	belongs_to :review
	belongs_to :user

	validates :body, length: { maximum: 300 }, presence: true
end
