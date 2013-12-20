GoalsApp::Application.routes.draw do

  resources :users
  resource :session
  resources :goals

  root :to => "users#index"
end
