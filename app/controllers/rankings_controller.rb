class RankingsController < ApplicationController
  
  before_filter :load_user, :only => :index
  before_filter :load_movie, :only => :new
  
  def index
    @rankings = @user.rankings.all(:include => :movie)
  end
  
  def new
    if @movie
      @ranking = Ranking.new(:movie_id => @movie.id)
    else
      render :template => 'movies/index'
    end
  end
  
  def create
    ranking = logged_in_user.rankings.create!(params[:ranking])
    redirect_to user_rankings_path(ranking.user)
  end
  
  private
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
  def load_movie
    @movie = Movie.find_by_id(params[:movie_id])
  end
  
end
