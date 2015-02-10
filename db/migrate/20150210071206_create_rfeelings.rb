class CreateRfeelings < ActiveRecord::Migration
  def change
    create_table :rfeelings do |t|
      t.integer :review_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
