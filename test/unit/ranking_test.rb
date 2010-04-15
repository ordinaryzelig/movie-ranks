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
  
  def test_create_with_tag
    user = User.make
    rankings_without_tags = 5.times.map do
      user.rankings.make
    end
    tag = Tag.make
    rankings_with_tags = 5.times.map do
      user.rankings.make(:tag => tag)
    end
    user.reload
    assert_equal rankings_without_tags, user.rankings.overall
    assert_equal rankings_with_tags, user.rankings.for_tag(tag)
    [rankings_without_tags, rankings_with_tags].each do |rankings|
      assert_equal (1..5).to_a, rankings.map(&:position)
    end
  end
  
  def test_validates_uniqueness_of_movie_id
    ranking = Ranking.make
    assert_raises(ActiveRecord::RecordInvalid) { ranking.clone.save! }
  end
  
  def test_percentile_calculated
    user = User.make
    9.times { user.rankings.make }
    ranking = user.rankings.make(:position_requested => 2)
    assert_equal 90, ranking.percentile
  end
  
  def test_calculate_percentiles!
    user = User.make
    10.times { user.rankings.make }
    user.rankings.reload
    assert_equal (1..10).map { |i| i * 10 }.reverse, user.rankings.map(&:percentile)
  end
  
end
