class IndexController < ApplicationController
	def index
		@things = Thing.where('publish = ?', true).order(id: :desc).page(params[:page]).per(15)
	end

	def hits
		@things = Thing.where('publish = ?', true).order(hits: :desc).page(params[:page]).per(15)
		render 'index'
	end

	def reviews
		@reviews = Review.where('publish = ?', true).order(hits: :desc).page(params[:page]).per(20)
	end
end
