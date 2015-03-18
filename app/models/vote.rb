class Vote < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

	belongs_to :voteable, polymorphic: true
  belongs_to :user

  include Notificationable
end
