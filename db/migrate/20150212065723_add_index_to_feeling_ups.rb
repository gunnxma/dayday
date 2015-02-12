class AddIndexToFeelingUps < ActiveRecord::Migration
  def change
  	add_index :feeling_ups, :feeling_id
		add_index :feeling_ups, :user_id
  end
end
