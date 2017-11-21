class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  end

  private

  def booking_params
    params.require(:bookings).permit(:status, :shift, :restaurant_id, :chef_id, :date, :shift, :cost_pennies)
  end

end
