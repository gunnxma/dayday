class CreateFanciers < ActiveRecord::Migration
  def change
    create_table :fanciers do |t|
      t.integer :thing_id
      t.integer :user_id

      t.timestamps
    end
  end
end
