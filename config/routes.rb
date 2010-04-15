ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => :rankings, :action => :new
  
  map.resources :movies, :only => [:create, :index, :show], :collection => {:search => :get}, :member => {:tag => :post} do |movie|
    movie.resources :rankings, :only => [:new]
  end
  
  map.resources :rankings, :only => :create
  
  map.resources :users do |user|
    user.resources :rankings, :only => [:index]
    user.resources :tags do |tag|
      tag.resources :rankings, :only => [:index, :new]
    end
  end
  
  map.resources :tags do |tag|
    tag.resources :movies, :only => [:index], :collection => {:search => :get} do |movie|
      movie.resources :rankings, :only => [:new]
    end
  end
  
  map.javascripts 'javascripts/:action.js', :controller => :javascripts, :format => :js
  
end
