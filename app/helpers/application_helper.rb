module ApplicationHelper
  
  def javascripts
    files = [
      'jquery',
      'jquery.corner',
      'application',
    ]
    javascript_include_tag(*files)
  end
  
  def more_javascript(action, options = {})
    content_for :more_javascript do
      # copied from javascript_src_tag(), which is private.
      content_tag("script", "", { "type" => Mime::JS, "src" => javascripts_path(action, options) })
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
