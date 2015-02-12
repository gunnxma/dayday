class AddIndexToRfeelings < ActiveRecord::Migration
  def change
  	add_index :rfeelings, :review_id
		add_index :rfeelings, :user_id
  end
end
