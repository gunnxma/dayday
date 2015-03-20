class NotificationsController < ApplicationController
	load_and_authorize_resource
	
	def index
		@notifications = current_user.notifications.order(id: :desc).page(params[:page]).per(15)
		@title = "提醒"
		current_user.notifications.unread.update_all(read: true)
	end

	def destroy
		notification = current_user.notifications.find(params[:id])
		notification.destroy
		redirect_to action: :index
	end
end
