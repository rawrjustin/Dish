FoodPrepApp::Application.routes.draw do
  resources :recipes, :path => "small"

  get "/large/new_catered_menu" => "menus#new_catered_menu"
  post "/large/create_catered_menu" => "menus#create_catered_menu"
  get "/large/new_cooked_menu" => "menus#new_cooked_menu"
  post "/large/create_cooked_menu" => "menus#create_cooked_menu"
  resources :menus, :path => "large", :only => [:index, :show]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
