class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @chef = Chef.find(params[:chef_id])
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize(@booking)
    @booking.save
  end

  private

  def booking_params
    params.require(:bookings).permit(:status, :shift, :restaurant_id, :chef_id, :date, :shift, :cost_pennies)
  end

end
