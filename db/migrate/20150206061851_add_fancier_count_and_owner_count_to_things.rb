class AddFancierCountAndOwnerCountToThings < ActiveRecord::Migration
  def change
    add_column :things, :fancier_count, :integer
    add_column :things, :owner_count, :integer
  end
end
