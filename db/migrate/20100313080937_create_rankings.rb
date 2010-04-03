class CreateRankings < ActiveRecord::Migration
  
  def self.up
    create_table :rankings do |t|
      t.belongs_to :movie, :null => false
      t.belongs_to :user, :null => false
      t.belongs_to :tag
      t.integer :position
      # updated at would make acts_as_list slower than necessary.
      t.datetime :created_at
    end
  end
  
  def self.down
    drop_table :rankings
  end
end
