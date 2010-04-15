class CreateRankingAverages < ActiveRecord::Migration
  
  def self.up
    create_table :ranking_averages, :force => true do |t|
      t.integer :percentile
      t.belongs_to :movie, :null => false
      t.belongs_to :tag
      t.timestamps
    end
    add_index :ranking_averages, :percentile
    add_index :ranking_averages, [:movie_id, :tag_id], :unique => true
  end
  
  def self.down
    drop_table :ranking_averages
  end
  
end
