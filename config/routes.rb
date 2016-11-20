Rails.application.routes.draw do
  devise_for :users

  constraints format: 'json' do
    root to: 'home#index'
    constraints subdomain: 'api' do
      scope module: 'api' do
        namespace :v1 do
          resources :houses
        end
      end
    end
  end
end
