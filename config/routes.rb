ActionController::Routing::Routes.draw do |map|
  map.resources :units, :member => { :quiz => :get }

  map.check_answer '/answers/:id/check/:text', :controller => 'answers', :action => 'check'

  map.root :units
end
