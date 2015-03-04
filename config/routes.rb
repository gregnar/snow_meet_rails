Rails.application.routes.draw do
  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create]
  get "/me", to: "sessions#index"
  namespace :api do
    namespace :v1 do
      resources :trips
      resources :groups
      resources :users
      resources :rsvps
    end
  end
end
