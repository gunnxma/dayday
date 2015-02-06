class AddPriceAndBuyUrlToThings < ActiveRecord::Migration
  def change
    add_column :things, :price, :string
    add_column :things, :buy_url, :string
  end
end
