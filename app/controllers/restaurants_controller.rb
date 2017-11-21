class RestaurantsController < ApplicationController
 before_action :find_restaurant, only: [ :show, :destroy, :update ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    authorize(@restaurant)
  end

  def create
    @restaurant = Restaurant.create
    authorize(@restaurant)
  end

  def edit
  end

  def update
  authorize(@restaurant)
  end

  private

  def

  def restaurant_params
    params.require(:restaurant).permit()
  end

  def find_restaurant
    @restaurant = Restaurant.find(restaurant_params)
  end
end
