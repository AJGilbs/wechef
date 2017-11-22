class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @chef = Chef.find(params[:chef_id])
    authorize(@booking)
  end

  def create
    @chef = Chef.find(params[:chef_id])
    @booking = Booking.new(booking_params)
    @booking.chef = @chef
    authorize(@booking)
    if @booking.save
      redirect_to chef_path(@chef)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :shift, :date, :restaurant_id, :chef_id, :cost_pennies)
  end

end
