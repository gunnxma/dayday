class Own < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :thing
  belongs_to :user
end
