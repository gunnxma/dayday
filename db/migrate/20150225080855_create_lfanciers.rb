class CreateLfanciers < ActiveRecord::Migration
  def change
    create_table :lfanciers do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
