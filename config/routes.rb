Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :houses do
    collection do
      post 'register_mortality', action: 'register_mortality'
    end
  end
  get 'dashboard', to: 'users#show', as: :dashboard

  get '*path', to: 'home#missing', as: :missed
end
