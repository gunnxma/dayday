class CreateThingTags < ActiveRecord::Migration
  def change
    create_table :thing_tags do |t|
      t.integer :thing_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
