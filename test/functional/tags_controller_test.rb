require 'test_helper'

class TagsControllerTest < ActionController::TestCase     
  
  def test_show_redirects_to_movies
    tag = Tag.make
    get :show, :id => tag.to_param
    assert_redirected_to tag_movies_path(tag)
  end
  
end
