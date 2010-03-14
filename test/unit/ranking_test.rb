require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  
  def test_create_inserts_into_correct_position
    user = User.make
    10.times do
      user.rankings.make
    end
    position = 3
    ranking_inserted = user.rankings.make(:position_requested => position)
    assert_equal position, ranking_inserted.position
    assert_equal (1..user.rankings.size).to_a, user.rankings.map(&:position)
  end
  
end
