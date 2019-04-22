Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'top#index'
  resources :signin, only: [:index]
  resources :identification, only: [:index]
  resources :favorites, only: [:create, :destroy]
  resources :size_group, only: [:show]
  resources :categories, only: [:show]
  resources :category_sizes, only: [:show]
  resources :card, only: [:index, :new, :show, :create] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :users do
    collection do
      get :profile
      get :logout
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'done', to: 'purchase#done'
      post 'pay', to: 'purchase#pay'
    end
  end

  resources :items do
    get 'purchase', to: 'items#purchase'
    post 'pause_listing', to: 'items#pause_listing'
    post 'favorites', to: 'favorites#create'
    delete 'favorites', to: 'favorites#destroy'
  end

  resources :signup, only: [:index] do
    collection do
      get :sms_confirmation, to: 'signup#sms_confirmation', as: 'sms_confirmation'
      patch :address_registration, to: 'signup#address_registration', as: 'address_registration'
      patch :payment_registration, to: 'signup#payment_registration', as: 'payment_registration'
      get :completion, to: 'signup#completion', as: 'completion'
    end
  end

  resources :auth, only: [] do
    collection do
      get '/:provider/callback', to: 'users#create', as: 'auth_callback'
      get :failure, to: 'users#auth_failure', as: 'auth_failure'
    end
  end

  resources :search, only: [:index] do
    collection do
      get :detail_search, to: 'search#detail_search'
    end
  end
end
