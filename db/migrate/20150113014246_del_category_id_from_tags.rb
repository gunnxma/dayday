class DelCategoryIdFromTags < ActiveRecord::Migration
  def change
  	remove_column :tags, :category_id
  end
end
