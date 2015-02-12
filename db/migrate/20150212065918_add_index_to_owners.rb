class AddIndexToOwners < ActiveRecord::Migration
  def change
  	add_index :owners, :thing_id
		add_index :owners, :user_id
  end
end
