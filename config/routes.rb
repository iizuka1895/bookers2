Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  resources :books, only: [:new, :index, :create, :show, :edit, :update]
  resources :users, only: [:show, :edit, :create, :index, :update]

end
