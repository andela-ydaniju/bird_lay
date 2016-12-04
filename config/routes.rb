Rails.application.routes.draw do
  root to: 'home#index', as: :home

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'dashboard', to: 'users#show', as: :dashboard
end
