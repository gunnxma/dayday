class CreateLfeelings < ActiveRecord::Migration
  def change
    create_table :lfeelings do |t|
      t.integer :list_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
