module ApplicationHelper
  
  def javascripts
    files = [
      'jquery',
      'jquery.corner',
      'application',
    ]
    javascript_include_tag(*files)
  end
  
  def more_javascripts(*files)
    content_for :more_javascripts do
      javascript_include_tag(*files)
    end
  end
  
  def stylesheets
    stylesheet_link_tag 'layout', controller_name
  end
  
  def render_movie(movie, options = {})
    options[:id] ||= dom_id(movie)
    render(:partial => 'movies/movie', :object => movie, :locals => {:options => options})
  end
  
end
