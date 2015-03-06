class Feeling < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  include Voteable

  belongs_to :feelingable, polymorphic: true

	belongs_to :thing

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	validates :body, length: { maximum: 140 }, presence: true

	def self.new_with_owner(owner)
		self.new(:feelingable_type => owner.class.to_s, :feelingable_id => owner.id)
	end
end
