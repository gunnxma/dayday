class List < ActiveRecord::Base
	has_many :list_things, dependent: :destroy
	has_many :things, through: :list_things

	belongs_to :user

	def has_thing?(thing)
		return self.things.include? thing
	end
end
