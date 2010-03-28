require 'test_helper'

class ImdbMovieWithoutInternetTest < ActiveSupport::TestCase
  
  def setup
    super
    Imdb.use_without_internet = true
  end
  
  def test_make_adds_to_database
    imdb_movie = ImdbMovie.make
    assert Imdb.database.include?(imdb_movie.attributes)
  end
  
  def test_find_movie_by_id_without_internet
    imdb_movie = ImdbMovie.make
    assert_equal imdb_movie.attributes, Imdb.find_movie_by_id(imdb_movie.imdb_id).attributes
  end
  
  def test_search_movies_by_title_without_internet
    imdb_movie = ImdbMovie.make
    assert Imdb.search_movies_by_title(imdb_movie.title).detect { |hash| hash[:imdb_id] == imdb_movie.imdb_id }
  end
  
end
