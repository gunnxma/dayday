class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :action
      t.boolean :read, :default => false
      t.integer :notificationable_id
      t.string :notificationable_type

      t.timestamps
    end
  end
end
