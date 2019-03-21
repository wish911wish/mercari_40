Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'top#index'
  resources :items, only: [:index, :new]
  get '/signup', to: 'signup#index', as: 'user_signup'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation', as: 'sms_confirmation'
  patch '/signup/address_registration', to: 'signup#address_registration', as: 'address_registration'
  patch '/signup/payment_registration', to: 'signup#payment_registration', as: 'payment_registration'
  get '/signup/completion', to: 'signup#completion', as: 'completion'

end
