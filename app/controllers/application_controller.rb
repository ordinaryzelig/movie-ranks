# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all
  helper_method :logged_in_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  filter_parameter_logging :password
  
  protected
  
  def logged_in_user
    User.first
  end
  
  def load_tag
    @tag = Tag.find_by_name!(params[:tag_id], :include => :movies) if params[:tag_id]
  end
  
end
