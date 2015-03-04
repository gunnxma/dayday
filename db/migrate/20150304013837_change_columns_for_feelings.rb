class ChangeColumnsForFeelings < ActiveRecord::Migration
  def change
  	rename_column :feelings, :thing_id, :feelingable_id
  	rename_column :feelings, :up, :votes_count
  	change_column :feelings, :votes_count, :integer, :default => 0
  	add_column :feelings, :feelingable_type, :string
  end
end
