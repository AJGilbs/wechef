class PagesController < ApplicationController

  before_action :authenticate_restaurant!, only: :dashboard_restaurant
  before_action :authenticate_chef!, only: :dashboard_chef

  skip_after_action :verify_authorized, only: [:dashboard_restaurant, :dashboard_chef]
  after_action :verify_policy_scoped, only: [:dashboard_restaurant, :dashboard_chef]

  def dashboard_restaurant
    @requests = policy_scope(Request).where(status: 'pending').all
    @bookings = current_restaurant.bookings
  end

  def dashboard_chef
    @requests = []
    policy_scope(Request).each do |request|
      @requests << request if request.chef_ids.include?(current_chef.id)
    end

    @bookings = current_chef.bookings
  end

end
