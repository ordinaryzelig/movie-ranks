ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

class ActiveSupport::TestCase
  
  def setup
    Sham.reset
  end
  
  def login_as(user)
    @request.session[:user_id] = user.id
  end
  
end
