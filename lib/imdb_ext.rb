class ImdbMovie
  
  delegate :year, :to => :release_date, :allow_nil => true
  
  def year=(year)
    self.release_date = Date.parse("#{year}-1-1")
  end
  
  # Imdb.search_movies_by_title returns an array of hashes of title and year.
  # simulate the hash.
  def attributes
    attributes_for :title, :imdb_id, :year
  end
  
  def attributes=(atts)
    atts.each do |key, val|
      send "#{key}=", val
    end
  end
  
end
