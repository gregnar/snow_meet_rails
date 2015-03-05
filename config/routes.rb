Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :trips
      resources :groups
      resources :users
      resources :rsvps
      resources :sessions
    end
  end
end
