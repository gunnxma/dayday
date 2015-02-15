class FeelingUpsController < ApplicationController
	def create
		feeling = Feeling.find(params[:feeling_id])
		render plain: feeling.add_or_remove_up(current_user)
	end
end
