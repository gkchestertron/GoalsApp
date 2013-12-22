GoalsApp::Application.routes.draw do

  resources :users
  resource :session
  resources :goals do
    resources :cheers, :only => [:create, :destroy]
  end
<<<<<<< HEAD
  resources :categories
  root :to => "categories#index"
=======

  root :to => "sessions#new"
>>>>>>> parent of 1a294b5... Adds awesome styling and cheers/leaderboards
end
