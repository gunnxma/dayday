class Thing < ActiveRecord::Base
	has_many :photos
	belongs_to :user
	has_many :feelings
	has_many :fanciers
	has_many :owners
	has_many :reviews

	def page_title
		p_title = title
    p_title = "#{p_title} - #{subtitle}" if !subtitle.empty?
    p_title
	end

	def page_title_feelings
		"#{page_title} - 短评"
	end
end
