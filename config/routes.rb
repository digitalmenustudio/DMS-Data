Rails.application.routes.draw do
  # Devise for user authentication
  devise_for :users
  
  resources :users do
    member do
      put :switch_restaurant
    end
  end

  put :change_locale, controller: "application"

  resources :restaurants do
    member do 
      post :upload_data
    end
  end
  
  resources :daily_visits
  resources :menu_access_logs
  resources :tab_clicks
  resources :items
  resources :promotions

  root 'pages#home'

  namespace :api do
    namespace :v1 do
      resources :items, only: :index
      resources :restaurants, only: :index
      resources :daily_visits, only: :index
      resources :menu_access_logs, only: :index
      resources :tab_clicks, only: :index
      resources :promotions, only: :index
    end
  end
end
