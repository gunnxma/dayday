class BuysController < ApplicationController
	def create
		thing = Thing.find(params[:thing_id])
		if thing.buy_url.blank?
			redirect_to edit_thing_path(thing)
		else
			redirect_to thing.buy_url
		end
	end
end
