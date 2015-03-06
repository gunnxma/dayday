class UsersController < ApplicationController
	before_filter :find_user
	def show
		@title = "动态 － #{@user.name}"
		@activities = PublicActivity::Activity.where(owner: @user).where('`key` like ?','%create%').order("created_at desc").page(params[:page]).per(24)
	end

	def followings
		@title = "关注 － #{@user.name}"
		@followings = @user.followings.page(params[:page]).per(20)
	end

	def followers
		@title = "关注者 － #{@user.name}"
		@followers = @user.followers.page(params[:page]).per(20)
	end

	def fancies
		@title = "喜欢 － #{@user.name}"
		@fanciers = @user.fanciers.order(created_at: :desc).page(params[:page]).per(24)
	end

	def owns
		@title = "拥有 － #{@user.name}"
		@owners = @user.owners.order(created_at: :desc).page(params[:page]).per(24)
	end

	def things
		@title = "分享 － #{@user.name}"
		@things = @user.things.where(publish: true).order(created_at: :desc).page(params[:page]).per(24)
	end

	def lists
		@title = "列表 － #{@user.name}"
		@lists = @user.lists.order(created_at: :desc).page(params[:page]).per(24)
	end

	def reviews
		@title = "评测 － #{@user.name}"
		@reviews = @user.reviews.where(publish: true).order(created_at: :desc).page(params[:page]).per(24)
	end

	def feelings
		@title = "短评 － #{@user.name}"
		@feelings = @user.feelings.where('feelingable_type = ?', 'Thing').order(created_at: :desc).page(params[:page]).per(24)
	end

	private

	def find_user		
		@user = User.find(params[:id])
	end
end
