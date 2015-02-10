class RfeelingsController < ApplicationController
	before_filter :find_review, :only => [:create]

  def create
    @rfeeling = Rfeeling.new(rfeeling_params)
    @rfeeling.user_id = current_user.id
    @review.rfeelings << @rfeeling

    @review.save
  end

private

  def find_review
      @review = Review.find(params[:review_id])
  end

	def rfeeling_params
    params.require(:rfeeling).permit(:body)
  end
end
