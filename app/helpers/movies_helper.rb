module MoviesHelper
  
  def link_to_create_or_show_movie(content, movie, *opts)
    if movie.is_mock
      link_to content, movies_path(:imdb_id => movie.imdb_id), :method => :post
    else
      link_to content, movie
    end
  end
  
end
