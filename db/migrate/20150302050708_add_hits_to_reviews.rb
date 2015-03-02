class AddHitsToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :hits, :integer
  end
end
