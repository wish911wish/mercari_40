Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'top#index'
  resources :items, only: [:index, :new]
  resources :identification, only: [:index]
  resources :card, only: [:index, :new, :show]
  resources :purchase, only: [:index]
  resources :signin, only: [:index]
  resources :credit, only: [:index, :new, :show, :create]

  get '/signup', to: 'signup#index', as: 'user_signup'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation', as: 'sms_confirmation'
  patch '/signup/address_registration', to: 'signup#address_registration', as: 'address_registration'
  patch '/signup/payment_registration', to: 'signup#payment_registration', as: 'payment_registration'
  get '/signup/completion', to: 'signup#completion', as: 'completion'

  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure
  post 'credit/pay' => 'credit#pay'
  get 'purchase/done' => 'purchase#done'

end
