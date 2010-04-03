require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  def test_find_by_name!
    tag_name = 'good tim allen movie'
    ex = assert_raise(Tag::TagNotFound) { Tag.find_by_name!(tag_name) }
    assert_equal tag_name, ex.tag_name
  end
  
end