Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions' }
  namespace :api do
    namespace :v1 do
      resources :trips
      resources :groups
      resources :users
      resources :rsvps
      resources :instagrams, only: [:index, :show]
      resources :tweets, only: [:index, :show]
      get :csrf, to: 'csrf#index'
    end
  end
end
