ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => :rankings, :action => :new
  
  map.resources :movies, :only => [:create, :index], :collection => {:search => :get} do |movie|
    movie.resources :rankings, :only => [:new]
  end
  map.resources :rankings
  map.resources :users do |user|
    user.resources :rankings, :only => [:index]
  end
  
  map.connect 'javascripts/:action.js', :controller => :javascripts, :format => :js
  
end
