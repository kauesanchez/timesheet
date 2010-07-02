class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #  campo select , que lista os projetos no periodo. 
  #  arrumar relacionamentos
  #  arrumar campo de horas e soma-las. 
  #  calendario e datas (pensar na melhor forma)  

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