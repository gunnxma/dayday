class Rfeeling < ActiveRecord::Base
	belongs_to :review
	
	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	validates :body, length: { maximum: 300 }, presence: true
end
