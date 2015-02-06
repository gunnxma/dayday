class AddFanciersAndOwnersToThings < ActiveRecord::Migration
  def change
    add_column :things, :fanciers, :integer
    add_column :things, :owners, :integer
  end
end
