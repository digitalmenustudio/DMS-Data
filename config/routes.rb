Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    member do
      put :switch_restaurant
    end
  end

  put :change_locale, controller: "application"

  resources :restaurants

  root 'pages#home'
end
