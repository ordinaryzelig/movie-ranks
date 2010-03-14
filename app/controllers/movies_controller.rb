class MoviesController < ApplicationController
  
  def index
    
  end
  
  def search
    @movies = Movie.find_all_by_title_or_mock(params[:title])
    render :action => :index
  end
  
  def create
    movie = Movie.create_from_imdb_id(params[:imdb_id])
    redirect_to new_movie_ranking_path(movie)
  end
  
end
