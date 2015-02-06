class Owner < ActiveRecord::Base
	belongs_to :thing
	belongs_to :user
end
