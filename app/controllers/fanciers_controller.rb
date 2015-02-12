class FanciersController < ApplicationController
	def create
		thing = Thing.find(params[:thing_id])
		render plain: thing.add_or_remove_fancier(current_user)	
	end
end
