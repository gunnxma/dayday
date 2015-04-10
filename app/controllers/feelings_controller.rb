class FeelingsController < ApplicationController
	authorize_resource :class => false
	
  def create
    @feeling = current_user.feelings.new(feeling_params)
    @feeling.save
  end

private

	def feeling_params
    params.require(:feeling).permit(:feelingable_type, :feelingable_id, :body)
  end
end