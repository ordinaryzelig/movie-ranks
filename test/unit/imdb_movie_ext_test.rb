require 'test_helper'

class ImdbMovieExtTest < ActiveSupport::TestCase
  
  def test_delegate_year
    movie = ImdbMovie.make
    assert_equal movie.release_date.year, movie.year
  end
  
end
