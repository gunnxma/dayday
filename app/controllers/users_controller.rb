class UsersController < ApplicationController
	before_filter :find_user
	def show
		@title = @user.name
	end

	def followings
		@title = "关注 － #{@user.name}"
		@followings = @user.followings.order(id: :desc).page(params[:page]).per(20)
	end

	def followers
		@title = "关注者 － #{@user.name}"
		@followers = @user.followers.order(id: :desc).page(params[:page]).per(20)
	end

	def fancies
		@title = "喜欢 － #{@user.name}"
		@fanciers = @user.fanciers.order(id: :desc).page(params[:page]).per(20)
	end

	private

	def find_user		
		@user = User.find(params[:id])
	end
end
