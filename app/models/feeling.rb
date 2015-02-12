class Feeling < ActiveRecord::Base
	belongs_to :thing

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	has_many :feeling_ups

	validates :body, length: { maximum: 140 }, presence: true

	def add_or_remove_up(user)
		if self.feeling_ups.where(:user_id => user.id).exists?
			self.feeling_ups.where(:user_id => user.id).first.destroy
			self.up = self.feeling_ups.count
			self.save
			'removeok'
		else
			self.feeling_ups << user.feeling_ups.build
			self.up = self.feeling_ups.count
			self.save ? 'ok' : 'error'
		end
	end
end
