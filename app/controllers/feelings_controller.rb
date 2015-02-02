class FeelingsController < ApplicationController
	def create
		@thing = Thing.find(params[:thing_id])
    @feeling = Feeling.new(feeling_params)
    @feeling.up = 0
    @feeling.user_id = current_user.id
    @thing.feelings << @feeling

    respond_to do |format|
      if @thing.save
        #redirect_to :action => :new
        format.json { render json: @feeling, status: :created }
      else
        format.json { render json: @feeling.errors, status: :unprocessable_entity }
      end
    end
	end

private

	def feeling_params
    params.require(:feeling).permit(:body)
  end
end