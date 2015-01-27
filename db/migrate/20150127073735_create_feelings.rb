class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.integer :thing_id
      t.integer :user_id
      t.string :body
      t.integer :up

      t.timestamps
    end
  end
end
