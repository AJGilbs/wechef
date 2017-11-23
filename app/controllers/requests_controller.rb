class RequestsController < ApplicationController
  before_action :set_request, only: [:cancel, :update, :destroy]

  def new
    @request = Request.new
    @chefs = Chef.all.map { |chef| chef.id }
    authorize @request
  end

  def cancel

    @request.status = "cancel"
    @request.save!
    redirect_to myrestaurant_path
  end

  def create
    new_request = Request.new(request_params)
    new_request.restaurant = current_restaurant
    authorize new_request
    if new_request.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_request_path)
    end
  end

  def update
    @request.chef_ids.delete(current_chef.id)
    @request.save
    redirect_to dashboard_path
  end

  def destroy
    # delete current_chef id from the request's chef_ids array
    @request.chef_ids.delete(current_chef.id)
    # add current_chef id to the request's accepted_chef_ids
    @request.accepted_chef_ids << current_chef.id
    @request.save
    # create a booking for the current_chef
    new_booking = Booking.new(
      date: @request.date,
      shift: @request.shift,
      cost_pennies: @request.cost_pennies,
      restaurant: @request.restaurant,
      chef: current_chef
    )
    new_booking.save
    if @request.accepted_chef_ids.count == @request.number_of_chefs
      # destroy request
      @request.status = "complete"
      @request.save!
    end
    redirect_to dashboard_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:date, :shift, :cost_pennies, { :chef_ids => [] }, :number_of_chefs, :end_hours, :star_hours)
  end

end
