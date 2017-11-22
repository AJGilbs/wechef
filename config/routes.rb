Rails.application.routes.draw do
  root to: 'chefs#index'
  devise_for :chefs
  resources :chefs, only: [ :index, :edit, :update, :show ]
  devise_for :restaurants


  get 'dashboard', to: 'pages#dashboard_chef'

  get 'myrestaurant', to: 'pages#dashboard_restaurant'
  resources :requests, only: [ :new, :create, :update, :destroy ]
end
