class Photo < ActiveRecord::Base
	belongs_to :thing
	mount_uploader :avatar, PhotoUploader
end
