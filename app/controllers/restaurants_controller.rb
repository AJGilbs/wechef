class RestaurantsController < ApplicationController
 before_action :find_restaurant, only: [ :show, :destroy, :update ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def

  def restaurant_params
    params.require(:restaurant).permit()
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
