class Feeling < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  include Voteable

  belongs_to :feelingable, polymorphic: true

	belongs_to :thing

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	has_many :votes, as: :voteable, dependent: :destroy

	validates :body, length: { maximum: 140 }, presence: true

	def add_or_remove_up(user)
		if self.feeling_ups.by_user(user.id).exists?
			self.feeling_ups.by_user(user.id).first.destroy
			self.up = self.feeling_ups.count
			self.save
			'removeok'
		else
			self.feeling_ups << user.feeling_ups.build
			self.up = self.feeling_ups.count
			self.save ? 'ok' : 'error'
		end
	end

	def self.new_with_owner(owner)
		self.new(:feelingable_type => owner.class.to_s, :feelingable_id => owner.id)
	end
end
