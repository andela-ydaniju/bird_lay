Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'dashboard', to: 'users#show', as: :dashboard
end
