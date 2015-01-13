class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.string :subtitle
      t.string :official_site
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
