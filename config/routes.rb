Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/restaurants/yelpSearch'
      get '/restaurants/yelpDetails'
      get '/restaurants/yelpReviews'
      resources :users, only: [:index, :create]
      resources :restaurants, only: [:index, :create, :show]
      resources :comments, only: [:index, :create]
      resources :matches, only: [:index, :create, :show, :destroy, :delete]

      post '/sessions/', to: 'sessions#create'
      get '/sessions/', to: 'sessions#show'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
