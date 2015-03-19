module Mentionable
	extend ActiveSupport::Concern

	included do
    after_create do
    	self.class.send_mention_notification(self.id)
    end
    after_destroy :delete_notifiaction_mentions
	end

	def delete_notifiaction_mentions
    self.notifications.where(action: 'mention', notificationable_id: self.id, notificationable_type: self.class.name).destroy_all
  end

  def extract_mentioned_user_ids
  	mentioned_user_ids = []
    logins = body.scan(/@(\w{3,20})/).flatten
    if logins.any?
      mentioned_user_ids = User.where(name: logins).ids
    end
    mentioned_user_ids
  end

  def no_mention_user_ids
    [self.user.id]
  end

  def body_html
    mentioned_user_ids = self.notifications.where(action: 'mention', notificationable_id: self.id, notificationable_type: self.class.name).select(:user_id).pluck(:user_id)
    User.where(id: mentioned_user_ids).each do |user|
      self.body.gsub!("@#{user.name}",%(<a href="/users/#{user.id}" target="_blank">@#{user.name}</a>))
      #self.body.gsub!("@#{user.name}","")
    end
    self.body
  end

	module ClassMethods
	  def send_mention_notification(model_id)
	  	model = self.find(model_id)
	    (model.extract_mentioned_user_ids - model.no_mention_user_ids).each do |user_id|
	      Notification.create user_id: user_id, action: 'mention', notificationable_id: model.id, notificationable_type: model.class.name
	    end
	  end
	end	
end