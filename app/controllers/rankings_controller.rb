class RankingsController < ApplicationController
  
  before_filter :load_user, :only => :index
  before_filter :load_movie, :only => :new
  
  def index
    @rankings = @user.rankings.all(:include => :movie)
  end
  
  def new
    if @movie
      if first_ranking?
        create_from_attributes(:movie_id => @movie.id)
      else
        @ranking = logged_in_user.rankings.new(:movie_id => @movie.id)
      end
    else
      render :template => 'movies/index'
    end
  end
  
  def create
    create_from_attributes(params[:ranking])
  end
  
  private
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
  def load_movie
    @movie = Movie.find_by_id(params[:movie_id])
  end
  
  # TODO: make sure we're not making any unnecessary redirect requests after creation.
  def create_from_attributes(atts)
    ranking = logged_in_user.rankings.create!(atts)
    respond_to do |if_format_is|
      if_format_is.html { redirect_to user_rankings_path(ranking.user) }
      if_format_is.js { render :nothing => true }
    end
  end
  
  def first_ranking?
    logged_in_user.rankings.empty?
  end
  
end
