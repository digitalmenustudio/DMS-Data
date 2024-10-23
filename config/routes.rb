Rails.application.routes.draw do
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
end
