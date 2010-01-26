ActionController::Routing::Routes.draw do |map|
  map.resources :units, :member => { :quiz => :get }

  map.root :units
end
