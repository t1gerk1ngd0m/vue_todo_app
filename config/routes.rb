Rails.application.routes.draw do
  root to: 'task#index'
  get '/about', to: 'task#index'
  get '/contact', to: 'task#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update]
  end
end
