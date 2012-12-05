FoodPrepApp::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :recipes, :path => "small", :only => [:index, :show]
  resources :meals, :path => "large", :only => [:index, :show]
  resources :posts, :path => "tips", :only => [:index, :show]
  
  match "/small/add_new_comment" => "recipes#add_new_comment", :as => "add_new_comment_to_recipes", :via => [:post]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  
end
