ActionController::Routing::Routes.draw do |map|
  map.resources :units, :member => { :quiz => :get } do |unit|
    unit.resources :exercises do |exercise|
      exercise.resources :sentences, :member => { :check => :get } do |sentence|
        sentence.resources :answers
      end
    end
  end

  map.root :units
end
