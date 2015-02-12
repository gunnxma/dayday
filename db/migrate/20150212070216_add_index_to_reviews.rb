class AddIndexToReviews < ActiveRecord::Migration
  def change
  	add_index :reviews, :thing_id
		add_index :reviews, :user_id
  end
end
