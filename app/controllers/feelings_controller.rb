class FeelingsController < ApplicationController
	load_and_authorize_resource
	
  def create
    @feeling = current_user.feelings.new(feeling_params)
    @feeling.save
  end

private

	def feeling_params
    params.require(:feeling).permit(:feelingable_type, :feelingable_id, :body)
  end
end