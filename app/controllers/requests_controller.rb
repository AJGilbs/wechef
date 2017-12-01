class RequestsController < ApplicationController
  before_action :authenticate_restaurant!, only: [:new, :create, :cancel_chef, :cancel_all ]
  before_action :authenticate_chef!, only: [:update, :destroy]

  before_action :set_request, only: [:cancel_chef, :update, :destroy]

  def new
    @request = Request.new
    @chefs = Chef.all.map { |chef| chef.id }
    authorize @request
  end

  def cancel_all
    @request.status = "cancel"
    @request.save!
    redirect_to myrestaurant_path
  end

  def cancel_chef
    @request.chef_ids.delete(params['chef'].to_i)
    @request.save!
    redirect_to myrestaurant_path
  end

  def create
    new_request = Request.new(request_params)
    new_request.restaurant = current_restaurant
    new_request.chef_ids = params[:request][:chef_ids].split(',')
    hours = new_request.end_hours - new_request.start_hours
    cost = {}
    new_request.chef_ids.each do |chef_id|
     cost[chef_id] = Chef.find(chef_id).price * hours
    end
    new_request.cost = cost
    authorize new_request
    if new_request.save
      new_request.chef_ids.each do |chef_id|
        conversation = Conversation.create(chef_id: chef_id, restaurant: current_restaurant, request: new_request)
        conversation.messages.create(author: current_restaurant, body: new_request.description)
      end
      redirect_to myrestaurant_path
    else
      # redirect_back(fallback_location: new_request_path)
      @request = new_request
      render :new
    end
  end

  def update
    @request.chef_ids.delete(current_chef.id)
    @request.save
    @request.conversations.find_by(chef: current_chef.id)&.destroy
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
      start_hours: @request.start_hours,
      end_hours: @request.end_hours,
      cost: @request.cost[current_chef.id],
      restaurant: @request.restaurant,
      chef: current_chef
    )
    new_booking.save

    if @request.accepted_chef_ids.count == @request.number_of_chefs
      # destroy request
      @request.status = "complete"
      @request.save
    end

    redirect_to dashboard_path, notice: 'Accepted!'
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:date, :shift, :cost_pennies, :number_of_chefs, :end_hours, :start_hours, :description)
  end

end
