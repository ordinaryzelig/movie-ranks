class CreateUsers < ActiveRecord::Migration
  
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.boolean :is_admin, :default => false, :null => false
      t.timestamps
    end
    add_index :users, :name, :unique => true
  end
  
  def self.down
    drop_table :users
  end
  
end
