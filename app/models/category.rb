class Category < ActiveRecord::Base
	belongs_to :parent, :class_name => "Category", :foreign_key => "parent_id"
	has_many :children, :class_name => "Category", :foreign_key => "parent_id"
	has_many :category_tags, :dependent => :destroy
	has_many :tags, :through => :category_tags
end
