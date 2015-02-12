class AddIndexToFanciers < ActiveRecord::Migration
  def change
  	add_index :fanciers, :thing_id
		add_index :fanciers, :user_id
  end
end
