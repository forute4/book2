Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  root to: "homes#top"
  get 'homes/about'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, ]
  resources :users, only: [:show, :edit, :index, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
