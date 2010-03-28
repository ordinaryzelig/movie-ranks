require 'test_helper'

class ImdbMovieExtTest < ActiveSupport::TestCase
  
  def test_delegate_year
    movie = ImdbMovie.make
    assert_equal movie.release_date.year, movie.year
  end
  
  def test_year_equals
    imdb_movie = ImdbMovie.make
    assert_equal Date.today, imdb_movie.release_date
    imdb_movie.year = Date.today.year
    release_date = imdb_movie.release_date
    assert_equal [Date.today.year, 1, 1], [release_date.year, release_date.month, release_date.day]
  end
  
end
