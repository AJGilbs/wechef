Rails.application.routes.draw do
  root to: 'chefs#index'

devise_for :chefs, :controllers => { :registrations => "chefs" }
resources :chefs, only: [ :index, :edit, :update, :show ] do
   resources :bookings, only: [ :new, :create ]
    resources :reviews_chefs, only: [ :new, :create ]
    collection do
      get 'search', to: 'chefs#search'
      get 'selection', to: 'chefs#selection'
    end
  end

  devise_for :restaurants, :controllers => { :registrations => "restaurants" }
  resources :restaurants, only: [:edit, :update, :show]  do
    resources :reviews_restaurant, only: [ :new, :create ]

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

end
