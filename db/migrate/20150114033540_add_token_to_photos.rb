class AddTokenToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :token, :string
  end
end
