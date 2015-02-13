class BuysController < ApplicationController
	def create
		thing = Thing.find(params[:thing_id])
		if thing.buy_url?
			redirect_to thing.buy_url
		else
			redirect_to thing_path(thing)
		end
	end
end
