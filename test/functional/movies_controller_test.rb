require 'test_helper'

class MoviesControllerTest < ActionController::TestCase     
  
  def test_index
    get :index
    assert_response :success
  end
  
  def test_search_existing
    movie = Movie.make(:zelig)
    get :search, :title => movie.title
    assert assigns(:movies).include?(movie)
  end
  
  def test_create
    post :create, :imdb_id => Movie::Zelig_imdb_id
    assert Movie.find_by_imdb_id(Movie::Zelig_imdb_id)
  end
  
end
