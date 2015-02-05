class FeelingUp < ActiveRecord::Base
	belongs_to :feeling
	belongs_to :user
end
