class User < ActiveRecord::Base
  
  has_many :rankings, :extend => ArrayBinary
  has_many :movies, :through => :rankings
  
  validates_presence_of :name
  attr_protected :is_admin
  
end
