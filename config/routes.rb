FoodPrepApp::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :recipes, :path => "small", :only => [:index, :show]
  resources :meals, :path => "large", :only => [:index, :show]
  resources :posts, :path => "tips", :only => [:index, :show]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
