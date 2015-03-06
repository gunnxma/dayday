class List < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  include Likeable
  
	has_many :list_things, dependent: :destroy
	has_many :things, through: :list_things
	has_many :feelings, as: :feelingable, dependent: :destroy

	belongs_to :user

	def has_thing?(thing)
		return self.things.include? thing
	end
end
