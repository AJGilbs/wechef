Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs
  resources :chefs, only: [ :index, :edit, :update, :show ] do
    resources :bookings, only: [ :new, :create ]
    collection do
      get 'search', to: 'chefs#search'
    end
  end

  devise_for :restaurants, :controllers => {:registrations => "restaurants"}
  resources :restaurants, only: [:edit, :update, :show]

  get 'dashboard', to: 'pages#dashboard_chef'
  resources :bookings, only: [:new, :create]

  get 'myrestaurant', to: 'pages#dashboard_restaurant'

end
