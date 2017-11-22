Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs
  resources :chefs, only: [:index, :create, :edit, :update, :show] do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :restaurants

  get 'dashboard', to: 'pages#dashboard_chef'
  resources :bookings, only: [:new, :create]

  get 'myrestaurant', to: 'pages#dashboard_restaurant'
end
