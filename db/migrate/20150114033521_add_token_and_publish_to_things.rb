class AddTokenAndPublishToThings < ActiveRecord::Migration
  def change
  	add_column :things, :token, :string
  	add_column :things, :publish, :boolean
  end
end
