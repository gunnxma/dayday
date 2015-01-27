class Thing < ActiveRecord::Base
	has_many :photos
	belongs_to :user
	has_many :feelings
end
