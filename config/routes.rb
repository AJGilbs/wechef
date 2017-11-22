Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs
  resources :chefs, only: [:index, :create, :edit, :update, :show] do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :restaurants, :controllers => {:registrations => "restaurants"}
  resources :restaurants, only: [:edit, :update, :show]
end
