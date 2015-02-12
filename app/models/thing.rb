class Thing < ActiveRecord::Base
	has_many :photos

	belongs_to :user
	delegate :name, :avatar, :to => :user, :prefix => true, :allow_nil => true

	has_many :feelings
	has_many :fanciers
	has_many :owners
	has_many :reviews

	def to_param
		"#{self.id}-#{PinYin.of_string(self.title).to_s.parameterize}"
	end

	def page_title
		p_title = self.title
    p_title = "#{p_title} - #{self.subtitle}" unless self.subtitle.empty?
    p_title
	end

	def page_title_feelings
		"#{page_title} - 短评"
	end

	def page_title_reviews
		"#{page_title} - 评测"
	end

	def add_or_remove_fancier(user)
		if self.fanciers.where(:user_id => user.id).exists?
			self.fanciers.where(:user_id => user.id).first.destroy
			self.fancier_count = self.fanciers.count
			self.save
			'removeok'
		else
			self.fanciers << user.fanciers.build
			self.fancier_count = self.fanciers.count
			self.save ? 'ok' : 'error'
		end 
	end

	def add_or_remove_owner(user)
		if self.owners.where(:user_id => user.id).exists?
			self.owners.where(:user_id => user.id).first.destroy
			self.owner_count = self.owners.count
			self.save
			'removeok'
		else
			self.owners << user.owners.build
			self.owner_count = self.owners.count
			self.save ? 'ok' : 'error'
		end 
	end
end
