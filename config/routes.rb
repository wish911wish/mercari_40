Rails.application.routes.draw do
  root 'top#index'
  resources :items, only: [:index]
  resources :users, only: [:index]

end
