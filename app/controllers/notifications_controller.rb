class NotificationsController < ApplicationController
	def index
		@notifications = current_user.notifications.unread.order(id: :desc).page(params[:page]).per(15)
		@title = "提醒"
	end
end
