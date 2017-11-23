class RequestsController < ApplicationController

  def new
    @request = Request.new
    @chefs = Chef.all.map { |chef| chef.id }
    authorize @request
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
    request_to_update = Request.find(params[:id])
    authorize request_to_update
    request_to_update.chef_ids.delete(current_chef.id)
    request_to_update.save
    redirect_to dashboard_path
  end

  def destroy
    # get my request
    request_to_destroy = Request.find(params[:id])
    # authorize
    authorize request_to_destroy
    # delete current_chef id from the request's chef_ids array
    request_to_destroy.chef_ids.delete(current_chef.id)
    # add current_chef id to the request's accepted_chef_ids
    request_to_destroy.accepted_chef_ids << current_chef.id
    request_to_destroy.save
    # create a booking for the current_chef
    new_booking = Booking.new
    new_booking.date = request_to_destroy.date
    new_booking.shift = request_to_destroy.shift
    new_booking.cost_pennies = request_to_destroy.cost_pennies
    new_booking.restaurant = request_to_destroy.restaurant
    new_booking.chef = current_chef
    new_booking.save
    if request_to_destroy.accepted_chef_ids.count == request_to_destroy.number_of_chefs
      # destroy request
      request_to_destroy.destroy
    end
    redirect_to dashboard_path
  end

  private

  def request_params
    params.require(:request).permit(:date, :shift, :cost_pennies, {:chef_ids => []}, :number_of_chefs)
  end

end
