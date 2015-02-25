class LfanciersController < ApplicationController
	def create
		list = List.find(params[:list_id])
		render plain: list.add_or_remove_fancier(current_user)	
	end
end
