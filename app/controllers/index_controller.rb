class IndexController < ApplicationController
	def index
		@things = Thing.where('publish = ?', true).order(id: :desc).page(params[:page]).per(15)
	end
end
