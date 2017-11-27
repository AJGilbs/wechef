Rails.application.routes.draw do
  root to: 'chefs#index'

  resources :chefs, only: [ :index, :edit, :update, :show] do
    resources :reviews_chefs, only: [ :new, :create ]

    resources :bookings, only: [ :new, :create ]
    collection do
      get 'search', to: 'chefs#search'
      get 'selection', to: 'chefs#selection'
    end
  end

  resources :restaurants, only: [:edit, :update, :show] do
    resources :reviews_restaurants, only: [ :new, :create ]
  end

  get 'dashboard', to: 'pages#dashboard_chef'
  get 'myrestaurant', to: 'pages#dashboard_restaurant'
  resources :requests, only: [ :new, :create, :update, :destroy ] do
    member do
      patch 'cancel_all'
      patch 'cancel_chef'
    end
    resources :messages, only: [ :new, :create, :show, :index ]
  end

  devise_for :restaurants
  devise_for :chefs

end
