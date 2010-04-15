require 'test_helper'

class RankingAverageTest < ActiveSupport::TestCase
  
  def test_create_calculates_percentile
    users = 3.times.map { User.make }
    movie = Movie.make
    users.each do |user|
      movies = 2.times.map { Movie.make }
      movies << movie
      movies.shuffle
      movies.each do |m|
        user.rankings.make(:movie => m)
      end
    end
    average = Ranking.for_movie(movie).calculate(:avg, :percentile)
    ranking_avg = RankingAverage.find_by_movie_id(movie.id)
    ranking_avg.calculate_percentile!
    assert_equal average, ranking_avg.percentile
  end
  
  def test_create_after_movie_created
    movie = Movie.make
    assert movie.ranking_averages.any?
  end
  
  def test_create_after_movie_tagged
    movie = Movie.make
    tag = Tag.make
    movie.tags << tag
    assert RankingAverage.find_by_movie_id_and_tag_id(movie.id, tag.id)
  end
  
end
