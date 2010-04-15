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
  
  def admin?
    logged_in_user.try(:is_admin)
  end
  
  def score_for(ranking)
    render :partial => 'rankings/score', :locals => {:ranking => ranking}
  end
  
  def link_to_new_ranking(string, options = {})
    tag = options.delete(:tag)
    movie = options.delete(:movie)
    path = tag ? new_tag_movie_ranking_path(tag, movie) : new_movie_ranking_path(movie)
    link_to string, path
  end
  
  def score_or_link_to_new_ranking(ranking, options = {})
    if ranking
      score_for ranking
    else
      link_to_new_ranking 'rank it', options
    end
  end
  
end
