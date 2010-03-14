class CreateMovies < ActiveRecord::Migration
  
  def self.up
    create_table :movies do |t|
      t.string :title, :null => false
      t.string :imdb_id, :null => false
      t.integer :year, :null => false
      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :year
    add_index :movies, :imdb_id, :unique => true
  end
  
  def self.down
    drop_table :movies
  end
  
end
