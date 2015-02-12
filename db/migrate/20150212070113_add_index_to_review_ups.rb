class AddIndexToReviewUps < ActiveRecord::Migration
  def change
  	add_index :review_ups, :review_id
		add_index :review_ups, :user_id
  end
end
