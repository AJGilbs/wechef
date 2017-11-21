class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
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
end
