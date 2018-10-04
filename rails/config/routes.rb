Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post 'users', to: 'users#create'
      get 'users/:id', to: 'users#show'

      resources :recipes
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
