require 'test_helper'

class Array
  include ArrayBinary
end

class ArrayBinaryTest < ActiveSupport::TestCase
  
  def test_midpoint_of_empty
    assert_nil [].midpoint
  end
  
  def test_first_half
    a = [1, 2, 3, 4]
    assert_equal [1, 2], a.first_half
  end
  
  def test_last_half
    a = [1, 2, 3, 4]
    assert_equal [3, 4], a.last_half
  end
  
  def test_halves_for_odd_number_array
    a = [1, 2, 3]
    assert_equal [1], a.first_half
    assert_equal [2, 3], a.last_half
  end
  
end
