Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs, :controllers => { :registrations => "chefs" }
  resources :chefs, only: [ :index, :edit, :update, :show ] do
    resources :bookings, only: [ :new, :create ]
  end

  devise_for :restaurants, :controllers => { :registrations => "restaurants" }
  resources :restaurants, only: [:edit, :update, :show]

  get 'dashboard', to: 'pages#dashboard_chef'
  resources :bookings, only: [:new, :create]

  get 'myrestaurant', to: 'pages#dashboard_restaurant'

end
