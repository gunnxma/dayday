module Notificationable
	extend ActiveSupport::Concern

	included do
		has_many :notifications, as: :notificationable, dependent: :destroy		
	end
end