class FeelingUpsController < ApplicationController
	def create
		feeling = Feeling.find(params[:feeling_id])
		if feeling.feeling_ups.where("user_id = ? ", current_user.id).exists?
			feeling_up = feeling.feeling_ups.where("user_id = ? ", current_user.id).first
			feeling_up.destroy
			feeling.up = feeling.feeling_ups.count
			feeling.save
			render plain: 'removeok'
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
