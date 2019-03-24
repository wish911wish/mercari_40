Rails.application.routes.draw do
  get 'signup/index'

  root 'top#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:index]

  get '/users/profile', to: 'users#profile'
  get '/users/logout', to: 'users#logout'

  resources :signup, only: [:index]
  resources :signin, only: [:index]

end
