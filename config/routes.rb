Rails.application.routes.draw do
  devise_for :users
  get 'signup/index'

  root 'top#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:new, :sms_confirmation, :address_registration, :payment_registration, :completion]
  post '/signup/sms_confirmation', to: 'users#sms_confirmation', as: 'sms_confirmation'

  resources :signup, only: [:index]

end
