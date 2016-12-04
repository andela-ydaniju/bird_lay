Rails.application.routes.draw do
  root to: 'home#index', as: :home

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new', as: :signin
end
