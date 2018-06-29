Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :restaurants, only: [:index, :create, :show]
      resources :comments, only: [:index, :create]
      resources :matches, only: [:index, :create, :show, :destory]

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
