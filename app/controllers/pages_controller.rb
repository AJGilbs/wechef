class PagesController < ApplicationController

  before_action :authenticate_restaurant!, only: :dashboard_restaurant
  before_action :authenticate_chef!, only: :dashboard_chef

  def home
  end

  def dashboard_restaurant

  end

  def dashboard_chef
    @requests = []
    Request.all.each do |request|
      @requests << request if request.chef_ids.include?(current_chef.id)
    end

    @bookings = current_chef.bookings
  end

end
