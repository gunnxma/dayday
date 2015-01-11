class SessionsController < ApplicationController
	def new
	end

	def create
	  auth = request.env["omniauth.auth"]
	  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
	  #cookies[:user_id] = user.id
	  cookies.permanent[:user_id] = user.id
	  redirect_to root_url, :notice => "登录成功"
	end

	def destroy
	  cookies.delete :user_id
	  redirect_to root_url, :notice => "已退出"
	end

	def failure
		redirect_to new_session_url, notice: "用户名或密码错误，请重新登录！"
	end
end
