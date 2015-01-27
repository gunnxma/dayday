class FeelingsController < ApplicationController
	def create
		@thing = Thing.find(params[:thing_id])
    @feeling = Feeling.new(feeling_params)
    @thing.feelings << @feeling
    if @thing.save
      redirect_to :action => :new
    else
      render "new"
    end
	end

private

	def feeling_params
    params.require(:feeling).permit(:body)
  end
end