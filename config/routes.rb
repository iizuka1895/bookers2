Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  
  resources :books, only: [:new, :index, :create, :show]
  resources :users, only: [:show, :edit, :create, :index, :update]

end
