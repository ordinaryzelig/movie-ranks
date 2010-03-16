require 'test_helper'

class RankingsControllerTest < ActionController::TestCase     
  
  def test_index
    user = User.make
    10.times { user.rankings.make }
    get :index, :user_id => user.to_param
    assert_response :success
    assert_equal user.rankings, assigns('rankings')
  end
  
  def test_new_without_movie_renders_movie_search
    get :new
    assert_template 'movies/index'
  end
  
  def test_new_with_movie_renders_ranking_form
    user = User.make
    login_as user
    user.rankings.make
    movie = Movie.make
    get :new, :movie_id => movie.id
    assert_template 'new'
  end
  
  def test_create
    user = User.make
    login_as user
    movie = Movie.make
    ranking = Ranking.make_unsaved(:movie => movie, :position_requested => 1)
    post :create, :user_id => user.to_param, :ranking => ranking.attributes
    assert_redirected_to user_rankings_path(user)
    assert Ranking.find_by_user_id_and_movie_id(user, movie)
  end
  
  def test_first_new_ranking_automatically_creates
    user = User.make
    login_as user
    movie = Movie.make
    assert_difference('user.reload.rankings.size') do
      get :new, :movie_id => movie.id
    end
    assert_redirected_to user_rankings_path(user)
  end
  
end
