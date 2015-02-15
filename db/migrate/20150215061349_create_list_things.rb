class CreateListThings < ActiveRecord::Migration
  def change
    create_table :list_things do |t|
      t.integer :list_id
      t.integer :thing_id

      t.timestamps
    end
  end
end
