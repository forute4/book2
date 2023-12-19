Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  root to: "homes#top"
  get 'home/about' =>'homes#about', as: 'about'
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :books
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
