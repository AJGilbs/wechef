class ChefsController < ApplicationController
  before_action :authenticate_chef!, except: [:index, :show, :search]
  before_action :find_chef, only: [:create, :edit, :update, :show]

  def index #should show only 6 randon chefs
    @chefs = policy_scope(Chef)
  end

  def show
    @booking = Booking.new
    authorize(@chef)
    authorize(@booking)
  end

  def search
    @selection = []
    unless params[:date] = ""
      date = Date.parse(params[:date])
    # take all chefs that has different id returned by Booking.where(date: date)
      @chefs = Chef.where.not(id: Booking.where(date: date).pluck('chef_id'))
    # chefs = Chef.joins('LEFT OUTER JOIN bookings ON bookings.chef_id = chefs.id').where('date != ?', date)
    else
      @chefs = Chef.all
    end
    authorize(@chefs)
  end

  def selection
    # @chefs =
  end

  def edit
    @position = Position.new
    authorize(@chef)
  end

  def update
    authorize(@chef)
    if @chef.update(chef_params)
      redirect_to chef_path(@chef)
    else
      render "edit"
    end
  end

private

  def find_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:name, :addres, :phone_number, :experience, :photo, :description, :price)
  end

  # def position_params
  #     params.require(:chef).permit(:position => [:title, :description, :start_date, :end_date])
  # end

end
