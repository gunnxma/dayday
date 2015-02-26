class Lfeeling < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
	belongs_to :list
	belongs_to :user

	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	validates :body, length: { maximum: 300 }, presence: true
end
