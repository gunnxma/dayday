class SearchController < ApplicationController
	def things
		@things = Thing.where('publish = ? and `title` like ?', true, "%#{params[:key]}%").order(id: :desc).page(params[:page]).per(24)
	end
end
