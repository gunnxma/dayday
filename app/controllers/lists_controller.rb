class ListsController < ApplicationController
	def show
		@list = List.find(params[:id])
		@feelings = @list.feelings.order(id: :desc).page(params[:page]).per(15)
		@feeling = Feeling.new_with_owner(@list)
		@title = @list.title
	end
end
