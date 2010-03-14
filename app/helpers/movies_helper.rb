module MoviesHelper
  
  def link_to_create_movie_or_new_ranking(content, movie)
    if movie.is_mock
      link_to content, movies_path(:imdb_id => movie.imdb_id), :method => :post
    else
      link_to content, new_movie_ranking_path(movie)
    end
  end
  
end
