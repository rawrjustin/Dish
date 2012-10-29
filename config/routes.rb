FoodPrepApp::Application.routes.draw do
  resources :recipes, :path => "small"
  resources :menus, :path => "large"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
