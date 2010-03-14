require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_movies_unranked
    user = User.make
    user.rankings.make
    unranked_movie = Movie.make
    assert_equal [unranked_movie], user.movies.unranked
  end
  
end
