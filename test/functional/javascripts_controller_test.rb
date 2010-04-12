require 'test_helper'

class JavascriptsControllerTest < ActionController::TestCase     
  
  def test_new_ranking
    user = User.make
    tag = Tag.make
    rankings = 3.times.map { Ranking.make(:user => user) }
    rankings.first.update_attributes! :tag => tag
    login_as user
    get :new_ranking, :format => :js
    assert_equal user.rankings.overall, assigns(:rankings)
  end
  
  def test_new_ranking_with_tag
    user = User.make
    tag = Tag.make
    rankings = 3.times.map { Ranking.make(:user => user) }
    rankings.first.update_attributes! :tag => tag
    login_as user
    get :new_ranking, :tag_id => tag.to_param, :format => :js
    assert_equal user.rankings.for_tag(tag), assigns(:rankings)
  end
  
end
