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
  
  def test_tag_with_existing_tags
    login_as User.make
    movie = Movie.make
    tags = 2.times.map { Tag.make }
    post :tag, :id => movie.to_param, :tag_ids => tags.map(&:id)
    movie.reload
    assert tags.all? { |tag| movie.tags.include?(tag) }
  end
  
  def test_tag_with_new_tags
    login_as User.make
    movie = Movie.make
    new_tags = ['new tag 1', 'new tag 2']
    post :tag, :id => movie.to_param, :new_tags => new_tags.join(', ')
    movie.reload
    assert new_tags.all? { |tag| movie.tags.map(&:name).include?(tag) }
  end
  
end
