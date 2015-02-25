class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gender, :string
  	add_column :users, :location, :string
  	add_column :users, :site, :string
  	add_column :users, :description, :string
  end
end
