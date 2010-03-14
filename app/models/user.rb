class User < ActiveRecord::Base
  
  validates_presence_of :name
  has_many :rankings, :extend => ArrayBinary
  has_many :movies, :through => :rankings do
    def unranked
      Movie.all - self
    end
  end
  
end
