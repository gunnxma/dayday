class Feeling < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  include Voteable
  include Notificationable

  belongs_to :feelingable, polymorphic: true

	belongs_to :thing

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	validates :body, length: { maximum: 140 }, presence: true

	def self.new_with_owner(owner)
		self.new(:feelingable_type => owner.class.to_s, :feelingable_id => owner.id)
	end

	after_create do
		Feeling.send_feeling_notification(self.id)
	end

	def self.send_feeling_notification(feeling_id)
		feeling = Feeling.find(feeling_id)
		Notification.create user_id: feeling.feelingable.user.id, action: feeling.class.to_s, notificationable_id: feeling.id, notificationable_type: feeling.class.to_s
	end
end
