class Notification < ActiveRecord::Base
	belongs_to :notificationable, polymorphic: true
	belongs_to :user

	scope :unread, -> { where(:read, false) }

	after_create :realtime_push_to_client
  after_update :realtime_push_to_client

  def realtime_push_to_client
		if self.user
      hash = { :count => self.user.notifications.unread.count }
      FayeClient.send("/notifications_count/#{self.user.temp_access_token}", hash)
    end
	end
end