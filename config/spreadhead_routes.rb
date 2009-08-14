ActionController::Routing::Routes.draw do |map|
  map.resources :pages
  map.page '/page/*url', :controller => 'pages', :action => 'show'
  map.connect '*url', :controller => 'pages', :action => 'show'
end
