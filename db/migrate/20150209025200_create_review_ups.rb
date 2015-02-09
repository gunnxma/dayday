class CreateReviewUps < ActiveRecord::Migration
  def change
    create_table :review_ups do |t|
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
