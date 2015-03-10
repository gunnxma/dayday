require 'public_activity/testing'
PublicActivity.enabled = false

namespace :tags do
  desc 'rebuild thing\'s tags'
  task :rebuild => :environment do
    Thing.all.each do |thing|
	    Thing.add_tags(thing.id)
	  end
  end
end