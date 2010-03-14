class CreateRankings < ActiveRecord::Migration
  
  def self.up
    create_table :rankings do |t|
      t.integer :movie_id, :null => false
      t.integer :user_id, :null => false
      t.integer :position
      t.timestamps
    end
  end
  
  def self.down
    drop_table :rankings
  end
end
