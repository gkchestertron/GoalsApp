GoalsApp::Application.routes.draw do
  resources :users
  resource :session
  resources :goals do
    resources :cheers, :only => [:create, :destroy]
  end
  resources :categories
  root :to => "sessions#new"
end
