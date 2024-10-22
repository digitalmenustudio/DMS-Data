Rails.application.routes.draw do
  devise_for :users
  resources :users
  put :change_locale, controller: "application"

  root 'pages#home'
end
