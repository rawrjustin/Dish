FoodPrepApp::Application.routes.draw do
  # replace below with "resources :recipes"
  resources :recipes

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
