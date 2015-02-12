class AddIndexToThings < ActiveRecord::Migration
  def change
  	add_index :things, :user_id
  end
end
