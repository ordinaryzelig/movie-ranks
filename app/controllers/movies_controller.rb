class MoviesController < ApplicationController
  
  before_filter :load_tag
  
  def index
    @movies = @tag ? @tag.movies : Movie.all
  end
  
  def search
    if @tag
      @movies = @tag.movies.title_like(params[:title])
    else
      @movies = Movie.find_all_by_title_or_mock(params[:title])
    end
    render :action => :index
  end
  
  def create
    movie = Movie.create_from_imdb_id(params[:imdb_id])
    redirect_to new_movie_ranking_path(movie)
  end
  
end
