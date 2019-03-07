Rails.application.routes.draw do
  root 'top#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:index]

end
