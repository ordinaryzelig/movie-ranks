class JavascriptsController < ApplicationController
  
  before_filter :load_tag, :only => :new_ranking
  
  def new_ranking
    @rankings = logged_in_user.rankings
    @rankings = @rankings.for_tag(@tag)
    @rankings = @rankings.all(:include => :movie)
  end
  
end
