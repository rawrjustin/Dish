FoodPrepApp::Application.routes.draw do
  get "recipes/new"

  get "recipes/create"

  get "recipes/update"

  get "recipes/edit"

  get "recipes/destroy"

  get "recipes/index"

  get "recipes/show"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end