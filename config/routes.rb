Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: 'task#index'
  get '/about', to: 'task#index'
  get '/contact', to: 'task#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update]
  end
end
