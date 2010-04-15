=begin
  periodic updates
    only update if new ranking created since last update exists.
=end

class RankingAverage < ActiveRecord::Base
  
  belongs_to :tag
  belongs_to :movie
  
  default_scope :order => :percentile
  
  validates_presence_of :movie_id
  validates_uniqueness_of :movie_id, :scope => :tag_id
  
  def rankings
    Ranking.for_tag(tag).for_movie(movie)
  end
  
  def calculate_percentile!
    update_attributes! :percentile => rankings.calculate(:avg, :percentile)
  end
  
end
