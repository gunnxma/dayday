class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :detect_device_format

  helper_method :current_user

	def current_user
	  @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
	end

	rescue_from CanCan::AccessDenied do |exception|
    render_403
  end

  def render_404
  	@title = "404页面不存在"
    render_optional_error_file(404)
  end

  def render_403  	
    if current_user
    	@title = "403禁止访问"
    else
    	@title = "需要登录"
    end
    render_optional_error_file(403)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    fname = %W(404 403 422 500).include?(status) ? status : 'unknown'
    render template: "/errors/#{fname}", format: [:html],
           handler: [:erb], status: status, layout: 'application'
  end

  private

    def detect_device_format
      case request.user_agent
      when /iPad/i
        request.variant = :tablet
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Android/i
        request.variant = :tablet
      when /Windows Phone/i
        request.variant = :phone
      end
    end
end
