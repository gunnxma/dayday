class Review < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  include Voteable
  
	belongs_to :thing
	
	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	has_many :feelings, as: :feelingable, dependent: :destroy

	validates :title, :body, presence: true

	def page_title
    "#{title} - #{thing.title}"
	end

	def self.new_by_publish(params, publish)
		review = self.new(params)
		review.publish = publish
		review.up = 0
		review
	end

	def update_attributes_with_publish(params, publish)
		self.publish = publish
		self.update_attributes(params)
	end

	def add_hit
		self.hits ||= 0
		self.hits = self.hits + 1
		self.save
	end
end
