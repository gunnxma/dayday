class AddIndexToCategoryTags < ActiveRecord::Migration
  def change
  	add_index :category_tags, :category_id
  	add_index :category_tags, :tag_id
  end
end
