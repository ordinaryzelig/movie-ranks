class Ranking < ActiveRecord::Base
  
  belongs_to :movie
  belongs_to :user
  
  attr_accessor :position_requested
  
  default_scope :order => :position
  
  validates_presence_of :movie_id
  validates_presence_of :user_id
  
  after_create :insert_at_position_requested, :if => :position_requested
  
  acts_as_list :scope => :user_id
  
  # alias rank position.
  def rank
    position
  end
  
  private
  
  def insert_at_position_requested
    insert_at @position_requested
  end
  
end
