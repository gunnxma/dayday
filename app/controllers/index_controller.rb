class IndexController < ApplicationController
	def index
		@things = Thing.order(id: :desc).page(params[:page]).per(15)
	end
end
