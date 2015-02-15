class ListThing < ActiveRecord::Base
	belongs_to :list
	belongs_to :thing
end
