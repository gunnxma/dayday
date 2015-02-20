class UsersController < ApplicationController
	before_filter :find_user, :only => [ :show, :followings ]
	def show
		@title = @user.name
	end

	def followings
		@title = "关注 － #{@user.name}"
		@followings = @user.followings.order(id: :desc).page(params[:page]).per(2)
	end

	private

	def find_user		
		@user = User.find(params[:id])
	end
end
