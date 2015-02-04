class FeelingsController < ApplicationController
	def create
		@thing = Thing.find(params[:thing_id])
    @feeling = Feeling.new(feeling_params)
    @feeling.up = 0
    @feeling.user_id = current_user.id
    @thing.feelings << @feeling

    @thing.save
	end

private

	def feeling_params
    params.require(:feeling).permit(:body)
  end
end