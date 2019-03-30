Rails.application.routes.draw do
  get 'signup/index'

  root 'top#index'
  resources :items, only: [:index, :new]
  resources :users do
    collection do
      get :profile
      get :logout
    end
  end

  resources :signup, only: [:index]
  resources :signin, only: [:index]

end
