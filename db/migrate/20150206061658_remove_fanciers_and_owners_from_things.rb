class RemoveFanciersAndOwnersFromThings < ActiveRecord::Migration
  def change
  	remove_column :things, :fanciers
  	remove_column :things, :owners
  end
end
