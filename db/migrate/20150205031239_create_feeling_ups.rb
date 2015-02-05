class CreateFeelingUps < ActiveRecord::Migration
  def change
    create_table :feeling_ups do |t|
      t.integer :feeling_id
      t.integer :user_id

      t.timestamps
    end
  end
end
