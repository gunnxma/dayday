class SettingsController < ApplicationController
	before_filter :find_user, :except => [:index]
	def index
	end

	def profile
	end

	def save_profile
		if @user.update_attributes(user_params)
			flash[:notice] = '个人信息修改成功'
			redirect_to settings_path
		else
			flash[:notice] = '个人信息修改失败'
			render 'profile'
		end
	end

	def drafts
		@things = current_user.things.where('publish = ?', false).order(id: :desc)
		@reviews = current_user.reviews.where('publish = ?', false).order(id: :desc)
	end

	private

	def find_user
		@user = current_user
	end

	def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache, :gender, :location, :site, :description)
  end
end
