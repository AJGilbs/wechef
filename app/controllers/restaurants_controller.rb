class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :show, :update, :edit ]

  def show
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize(@restaurant)
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render "edit"
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:email, :website_address, :photo, :phone_number, :address, :name)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
