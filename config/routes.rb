Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs
  resources :chefs do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :restaurants
end
