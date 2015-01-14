class PhotosController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :check_user

	def index
		token = params[:token]
		@photos = Photo.where('token = ?', token)
		render :layout => false
	end

	def create
		photo = Photo.new
		photo.token = params[:token]
		photo.avatar = params[:imgfile]
		photo.save!
		render :text => 'ok'
	end

	def destroy
		photo = Photo.find(params[:id])
		photo.destroy
		render :text => 'ok'		
	end
end
