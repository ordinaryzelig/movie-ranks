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
  
  def test_index_with_tag
    tag = Tag.make
    movies = tag.movies << Movie.make
    get :index, :tag_id => tag.to_param
    assert_equal tag, assigns(:tag)
    assert_equal movies, assigns(:movies)
  end
  
  def test_search_with_tag
    tag = Tag.make
    movie = Movie.make
    movie.tags << tag
    get :search, :title => movie.title, :tag_id => tag.to_param
    assert_equal [movie], assigns(:movies)
  end
  
end
