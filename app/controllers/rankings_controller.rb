class RankingsController < ApplicationController
  
  before_filter :load_tag, :only => [:index, :new]
  before_filter :load_user, :only => :index
  before_filter :load_movie, :only => :new
  
  def index
    @rankings = @user.rankings
    @rankings = @rankings.for_tag(@tag)
    @rankings = @rankings.all(:include => :movie)
  end
  
  def new
    if @movie
      user_rankings = logged_in_user.rankings.for_tag(@tag)
      is_first_ranking = user_rankings.empty?
      if is_first_ranking
        create_from_attributes(:movie => @movie, :tag => @tag)
      else
        already_ranked = user_rankings.map(&:movie_id).include?(@movie.id)
        redirect_to @tag ? tag_user_rankings(@tag, logged_in_user) : user_rankings_path(logged_in_user) if already_ranked
      end
    else
      render :template => 'movies/index'
    end
  end
  
  def create
    create_from_attributes(params[:ranking])
  end
  
  protected
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
  def load_movie
    @movie = Movie.find_by_id(params[:movie_id])
  end
  
  def create_from_attributes(atts)
    ranking = logged_in_user.rankings.create!(atts)
    respond_to do |if_format_is|
      if_format_is.html do
        path = ranking.tag ? user_tag_rankings_path(ranking.user, ranking.tag) : user_rankings_path(ranking.user)
        redirect_to path
      end
      if_format_is.js { render :nothing => true }
    end
  end
  
end
