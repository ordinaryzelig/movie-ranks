class CreateTags < ActiveRecord::Migration
  
  def self.up
    create_table :tags do |t|
      t.string :name, :null => false
      t.timestamps
    end
    create_table :movies_tags, :id => false, :force => true do |t|
      t.belongs_to :movie
      t.belongs_to :tag
      t.datetime :created_at
    end
  end
  
  def self.down
    drop_table :tags
    drop_table :movies_tags
  end
  
end
