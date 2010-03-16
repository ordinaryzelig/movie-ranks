class JavascriptsController < ApplicationController
  
  def new_ranking
    @rankings = logged_in_user.rankings(:include => :movie)
  end
  
end
