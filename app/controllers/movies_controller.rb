class MoviesController < ApplicationController
  
  before_filter :load_tag, :except => :tag
  
  def index
    @movies = @tag ? @tag.movies : Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id], :include => :tags)
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
    redirect_to movie
  end
  
  def tag
    movie = Movie.find(params[:id])
    # add existing tags.
    if params[:tag_ids]
      movie.tags << Tag.find(*params[:tag_ids])
    end
    # add new tags.
    if params[:new_tags]
      new_tags = params[:new_tags].split(/,\s+/).map { |name| Tag.create!(:name => name) }
      movie.tags << new_tags
    end
    redirect_to movie
  end
  
end
