class MoviesController < ApplicationController
  
  before_filter :load_tag
  
  def index
    @movies = @tag ? @tag.movies : Movie.all
  end
  
  def search
    @movies = Movie.find_all_by_title_or_mock(params[:title])
    render :action => :index
  end
  
  def create
    movie = Movie.create_from_imdb_id(params[:imdb_id])
    redirect_to new_movie_ranking_path(movie)
  end
  
  protected
  
  def load_tag
    @tag = Tag.find_by_name!(params[:tag_id]) if params[:tag_id]
  end
  
end
