require 'public_activity/testing'
PublicActivity.enabled = false

namespace :tags do
  desc 'rebuild thing\'s tags'
  task :rebuild => :environment do
    Thing.all.each do |thing|
	    thing.add_tags
	  end
  end
end