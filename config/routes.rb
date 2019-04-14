Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'top#index'
  resources :users do
    collection do
      get :profile
      get :logout
    end
  end
  resources :signin, only: [:index]
  resources :identification, only: [:index]
  resources :card, only: [:index, :new, :show, :create]
  resources :purchase, only: [:index]
  resources :favorites, only: [:create, :destroy]
  resources :items do
    get 'purchase', to: 'items#purchase'
    post 'pause_listing', to: 'items#pause_listing'
    post 'favorites', to: 'favorites#create'
    delete 'favorites', to: 'favorites#destroy'
  end

  get '/signup', to: 'signup#index', as: 'user_signup'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation', as: 'sms_confirmation'
  patch '/signup/address_registration', to: 'signup#address_registration', as: 'address_registration'
  patch '/signup/payment_registration', to: 'signup#payment_registration', as: 'payment_registration'
  get '/signup/completion', to: 'signup#completion', as: 'completion'

  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

  post 'purchase/pay', to: 'purchase#pay'
  post 'card/show', to: 'card#show'
  post 'card/pay', to: 'card#pay'
  post 'card/delete', to: 'card#delete'
  get 'purchase/done', to: 'purchase#done'

end