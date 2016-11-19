Rails.application.routes.draw do
  devise_for :users
  constraints format: 'json' do
    root to: 'home#index'
  end
end
