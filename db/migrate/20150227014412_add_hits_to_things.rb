class AddHitsToThings < ActiveRecord::Migration
  def change
    add_column :things, :hits, :integer
  end
end
