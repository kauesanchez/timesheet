ActionController::Routing::Routes.draw do |map|
  map.resources :projetos

  map.resources :periodos

  map.root :controller => "user"
  
  map.forgot_password 'forgot_password', :controller=>:user, :action=>:forgot_password
  map.login   'login', :controller=>:user, :action=>:login
  map.logout  'logout', :controller=>:user, :action=>:logout
  map.bases 'bases/:action.:format', :controller=>:bases
  

  
  map.resources :user, :except=>[:show]
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
