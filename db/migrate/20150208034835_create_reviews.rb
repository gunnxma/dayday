class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :thing_id
      t.string :title
      t.string :body
      t.integer :up
      t.boolean :publish

      t.timestamps
    end
  end
end
