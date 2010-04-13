class Ranking < ActiveRecord::Base
  
  belongs_to :movie
  belongs_to :user
  belongs_to :tag
  
  attr_accessor :position_requested
  
  default_scope :order => :position
  # if tag is nil. will return overall.
  named_scope :for_tag, proc { |tag| {:conditions => {:tag_id => tag ? tag.id : nil}} }
  named_scope :overall, :conditions => {:tag_id => nil}
  named_scope :for_movie, proc { |movie| {:conditions => {:movie_id => movie.id}} }
  
  validates_presence_of :movie_id
  validates_presence_of :user_id
  validates_uniqueness_of :movie_id, :scope => [:user_id, :tag_id]
  
  after_create :insert_at_position_requested, :if => :position_requested
  
  # scope user_id and tag_id columns.
  acts_as_list :scope => 'user_id = #{user_id} AND #{tag_id ? "tag_id = #{tag_id}" : "tag_id is null"}'
  
  # alias rank position.
  def rank
    position
  end
  
  private
  
  def insert_at_position_requested
    insert_at @position_requested
  end
  
end
