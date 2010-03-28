=begin
mimic Imdb movies when there is no internet.
for each method that needs internet, do a sort of alias method chain that will
call the appropriate method with suffixes of _with_internet and _without_internet.
Imdb.use_without_internet= toggles use of Imdb class with internet on and off.
=end

class Imdb
  
  class << self
    
    attr_accessor :use_without_internet
    
    def use_without_internet=(bool)
      @use_without_internet = bool
      ImdbMovie.use_without_internet = bool
    end
    
    # alias methods with and without internet.
    [:search_movies_by_title, :find_movie_by_id].each do |original_method_name|
      method_name_with_internet = (original_method_name.to_s + '_with_internet').to_sym
      method_name_without_internet = (original_method_name.to_s + '_without_internet').to_sym
      alias_method method_name_with_internet, original_method_name
      # overwrite original method and direct method appropriately.
      define_method original_method_name do |*args|
        use_without_internet() ?
          send(method_name_without_internet, *args) :
          send(method_name_with_internet, *args)
      end
    end
    
    # in memory database.
    def database
      @@database ||= []
    end
    
    # ======================================================
    # methods that work without internet.
    # they are named after the original methods with a suffix of _without_internet.
    
    # find search the title in the in-memory database.
    def search_movies_by_title_without_internet(title)
      database.select { |attributes_hash| attributes_hash[:title].include?(title) }
    end
    
    # find the imdb_id from the in-memory database.
    # return an ImdbMovie with the attributes found.
    def find_movie_by_id_without_internet(imdb_id)
      imdb_movie = ImdbMovie.new
      imdb_movie.attributes = database.detect { |attributes_hash| attributes_hash[:imdb_id] == imdb_id }
      imdb_movie
    end
    
  end
  
end

class ImdbMovie
  
  class << self
    attr_accessor :use_without_internet
  end
  
  # use fake database when machinist is used.
  def self.make
    made = super
    Imdb.database << made.attributes if use_without_internet
    made
  end
  
end
