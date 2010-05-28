ActionController::Routing::Routes.draw do |map|
  map.root :controller => "colgate", :action=>'questions', :id=>1

  map.reports 'reports/:action.:format', :controller=>:reports
  map.disclaimer 'disclaimer', :controller=>:public, :action=>:disclaimer
  map.forgot_password 'forgot_password', :controller=>:user, :action=>:forgot_password
  map.privacy 'privacy', :controller=>:public, :action=>:privacy
  map.login   'login', :controller=>:user, :action=>:login
  map.logout  'logout', :controller=>:user, :action=>:logout
  map.connect 'facebook_share/:attribute/:id', :controller=>:colgate, :action=>:facebook_share
  map.connect 'survey/:action/:id', :controller=>:Colgate
  map.connect 'survey/:action/:id.:format', :controller=>:Colgate

  
  map.resources :user, :except=>[:show]
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
