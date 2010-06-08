# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  def login_required
    if session[:user]
      true
    else
      redirect_to :controller => "user", :action => "login"
      false
    end 
  end
  
  def admin_required
    if session[:user] && session[:user].role >= User::ADMIN
      true
    else
      redirect_to '/422.html'
      false
    end
  end

  def current_user
    session[:user]
  end
end