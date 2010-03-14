require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  
  def test_search_imdb
    title = 'Zelig'
    movies = Movie.search_imdb(title)
    assert movies.detect { |hash| hash[:imdb_id] == Movie::Zelig_imdb_id }
  end
  
  def test_find_all_by_imdb_id_or_mock
    existing = Movie.make
    non_existent = Movie.search_imdb('Zelig')[0, 1]
    mocked = non_existent.map { |imdb_hash| Movie.new_mock(imdb_hash) }
    expected = ([existing] + mocked).map(&:imdb_id).sort
    tested = Movie.find_all_by_imdb_id_or_mock([existing.attributes] + non_existent).map(&:imdb_id).sort
    assert_equal expected, tested
  end
  
  def test_named_scope_with_imdb_ids
    movies = 3.times.map { Movie.make }
    assert_equal movies.map(&:id).sort, Movie.with_imdb_ids(*movies.map(&:imdb_id)).map(&:id).sort
  end
  
  def test_create_from_imdb_id
    imdb_movie = Imdb.find_movie_by_id(Movie::Zelig_imdb_id)
    movie = Movie.create_from_imdb_id(imdb_movie.imdb_id)
    fields = [:title, :year, :imdb_id]
    assert_equal movie.attributes_for(*fields), imdb_movie.attributes_for(*fields)
  end
  
end
