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
  
end
