class AddIndexToFeelings < ActiveRecord::Migration
  def change
  	add_index :feelings, :thing_id
		add_index :feelings, :user_id
  end
end
