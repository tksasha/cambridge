ActionController::Routing::Routes.draw do |map|
  map.resources :units, :member => { :quiz => :get }

  map.check_answer '/answers/:id/check', :controller => 'answers', :action => 'check', :conditions => { :method => :put }

  map.root :units
end
