Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions' }
  namespace :api do
    namespace :v1 do
      resources :trips
      resources :groups
      resources :users
      resources :rsvps
      resources :tweets, only: [:index]
      get :csrf, to: 'csrf#index'
    end
  end
end
