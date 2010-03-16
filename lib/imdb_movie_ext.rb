class ImdbMovie
  
  delegate :year, :to => :release_date, :allow_nil => true
  
end
