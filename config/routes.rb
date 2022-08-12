Rails.application.routes.draw do
  devise_for :users
  # get 'users/new'
  # get 'users/index'
  # get 'users/edit'
  # get 'users/show'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'homes/top'
  resources :users
  resources :books

  get '/homes/about' => "homes#about", as: 'about'

  root to: 'homes#top'

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
