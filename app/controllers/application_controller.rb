class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
	end

	def check_user
		if !current_user
			redirect_to :controller => :sessions, :action => :new
		end
	end
end
