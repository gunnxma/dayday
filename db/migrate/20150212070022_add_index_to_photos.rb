class AddIndexToPhotos < ActiveRecord::Migration
  def change
  	add_index :photos, :thing_id
  end
end
