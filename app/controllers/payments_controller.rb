class PaymentsController < ApplicationController
  before_action :set_booking
  def new
    authorize @booking
  end

  def create
    authorize @booking
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @booking.cost_pennies,
      description:  "Payment for booking #{@booking.id}",
      currency:     @booking.cost.currency
    )

    @booking.update(payment: charge.to_json, status: 'paid')
    redirect_to myrestaurant_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_booking_payment(@booking)
  end

  private

  def set_booking
    @booking = Booking.where(status: 'unpaid').find(params[:booking_id])
  end

end
