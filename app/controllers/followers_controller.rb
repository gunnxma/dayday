class FollowersController < ApplicationController
	authorize_resource :class => false
	
	def create
		user = User.find(params[:user_id])
		user.followers << current_user
		user.save

		render plain: 'ok'
	end

	def destroy
		user = User.find(params[:user_id])
		user.followers.delete(current_user)
		user.save

		render plain: 'removeok'
	end
end
