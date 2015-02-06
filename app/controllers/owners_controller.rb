class OwnersController < ApplicationController
	def create
		thing = Thing.find(params[:thing_id])
		if thing.owners.where("user_id = ? ", current_user.id).exists?
			owner = thing.owners.where("user_id = ? ", current_user.id).first
			owner.destroy
			thing.owner_count = thing.owners.count
			thing.save
			render plain: 'removeok'
		else
			owner = Owner.new
			owner.user_id = current_user.id
			thing.owners << owner
			thing.owner_count = thing.owners.count
			if thing.save
				render plain: 'ok'
			else
				render plain: 'error'
			end
		end
	end
end
