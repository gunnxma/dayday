class ReviewUpsController < ApplicationController
	def create
		review = Review.find(params[:review_id])
		if review.review_ups.where("user_id = ? ", current_user.id).exists? || review.user_id == current_user.id
			render plain: 'error'
		else
			review_up = ReviewUp.new
			review_up.user_id = current_user.id
			review.review_ups << review_up
			review.up = review.review_ups.count
			if review.save
				render plain: 'ok'
			else
				render plain: 'error'
			end
		end
	end
end
