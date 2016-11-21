Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  scope module: 'api' do
    namespace :v1 do
      resources :houses
    end
  end
end
