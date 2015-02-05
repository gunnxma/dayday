class Feeling < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user
	has_many :feeling_ups

	validates :body, length: { maximum: 140 }, presence: true
end
