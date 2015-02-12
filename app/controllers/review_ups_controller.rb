class ReviewUpsController < ApplicationController
	def create
		review = Review.find(params[:review_id])
		render plain: review.add_or_remove_up(current_user)		
	end
end
