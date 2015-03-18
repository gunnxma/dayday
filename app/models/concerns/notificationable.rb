module Notificationable
	extend ActiveSupport::Concern

	included do
		has_many :notifications, as: :notificationable, dependent: :destroy

		after_create do
			self.class.send_notification(self.id)
		end
	end

	module ClassMethods
		def send_notification(model_id)
			model = self.find(model_id)
			modelable = model.send("#{model.class.to_s.downcase}able")
			#return if modelable.user == model.user
			Notification.create user_id: modelable.user.id, action: model.class.to_s.downcase, notificationable_id: model.id, notificationable_type: model.class.to_s
		end
	end
	
end