class ListsController < ApplicationController
	def show
		@list = List.find(params[:id])
		@lfeelings = @list.lfeelings.order(id: :desc).page(params[:page]).per(15)
		@title = @list.title
	end
end
