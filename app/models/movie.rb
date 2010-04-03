class Movie < ActiveRecord::Base
  
  has_many :rankings, :extend => ArrayBinary
  has_and_belongs_to_many :tags
  
  attr_accessor :is_mock
  
  default_scope :order => 'title'
  named_scope :with_imdb_ids, proc { |*imdb_ids| {:conditions => "imdb_id in (#{imdb_ids.map { |imdb_id| "'#{imdb_id}'" }.join(', ')})"} }
  named_scope :title_like, proc { |title| {:conditions => "lower(title) like '%#{title.downcase}%'"} }
  
  validates_presence_of :title
  validates_presence_of :imdb_id
  
  # wrapper for Imdb.search_movies_by_title that always returns an array.
  def self.search_imdb(title)
    movies = Imdb.search_movies_by_title(title)
    case movies
    when Array
      movies
    when Hash
      [movies]
    else
      []
    end
  end
  
  def self.find_all_by_imdb_id_or_mock(imdb_hashes)
    imdb_ids = imdb_hashes.map { |imdb_hash| imdb_hash[:imdb_id] }
    found = Movie.with_imdb_ids(*imdb_ids)
    imdb_hashes.map do |imdb_hash|
      found.detect { |movie| movie.imdb_id == imdb_hash[:imdb_id]} || Movie.new_mock(imdb_hash)
    end
  end
  
  def self.find_all_by_title_or_mock(title)
    find_all_by_imdb_id_or_mock(search_imdb(title))
  end
  
  def self.new_mock(atts = {})
    new(atts.merge(:is_mock => true))
  end
  
  def self.create_from_imdb_id(imdb_id)
    imdb_movie = Imdb.find_movie_by_id(imdb_id)
    create! imdb_movie.attributes_for(:title, :imdb_id, :year)
  end
  
end
