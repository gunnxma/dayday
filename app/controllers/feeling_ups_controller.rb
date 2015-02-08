class FeelingUpsController < ApplicationController
	def create
		feeling = Feeling.find(params[:feeling_id])
		if feeling.feeling_ups.where("user_id = ? ", current_user.id).exists? || feeling.user_id == current_user.id
			render plain: 'error'
		else
			feeling_up = FeelingUp.new
			feeling_up.user_id = current_user.id
			feeling.feeling_ups << feeling_up
			feeling.up = feeling.feeling_ups.count
			if feeling.save
				render plain: 'ok'
			else
				render plain: 'error'
			end
		end
	end
end
