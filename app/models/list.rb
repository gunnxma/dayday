class List < ActiveRecord::Base
	has_many :list_things, dependent: :destroy
	has_many :things, through: :list_things
	has_many :lfanciers
	has_many :lfeelings

	belongs_to :user

	def has_thing?(thing)
		return self.things.include? thing
	end

	def add_or_remove_fancier(user)
		if self.lfanciers.by_user(user.id).exists?
			self.lfanciers.by_user(user.id).first.destroy
			self.save
			'removeok'
		else
			self.lfanciers << user.lfanciers.build
			self.save ? 'ok' : 'error'
		end
	end
end
