Rails.application.routes.draw do
  devise_for :users
  resources :users
  put :change_locale, controller: "application"

  resources :restaurants

  root 'pages#home'
end
