class FanciersController < ApplicationController
	def create
		thing = Thing.find(params[:thing_id])
		if thing.fanciers.where("user_id = ? ", current_user.id).exists?
			fancier = thing.fanciers.where("user_id = ? ", current_user.id).first
			fancier.destroy
			thing.fancier_count = thing.fanciers.count
			thing.save
			render plain: 'removeok'
		else
			fancier = Fancier.new
			fancier.user_id = current_user.id
			thing.fanciers << fancier
			thing.fancier_count = thing.fanciers.count
			if thing.save
				render plain: 'ok'
			else
				render plain: 'error'
			end
		end
	end
end
