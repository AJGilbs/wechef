class ChefsController < ApplicationController
  before_action :authenticate_chef!, except: [:index, :show, :search]
  before_action :find_chef, only: [:create, :edit, :update, :show]

  def index #should show only 6 randon chefs
    @chefs = policy_scope(Chef)
  end

  def show
    #do not delete this allow, it's o show the back arrow in the nav on show page!
    @allow = true
    @request = Request.new
    authorize(@chef)
    authorize(@request)
  end

  def search
    if params[:date] != "" && params[:position]
      date = Date.parse(params[:date])
      @chefs = Chef.where.not(id: Booking.where(date: date).pluck('chef_id')).joins(:positions).where("positions.title" => params[:position])
    elsif  params[:date] != ""
      date = Date.parse(params[:date])
      @chefs = Chef.where.not(id: Booking.where(date: date).pluck('chef_id'))
    elsif params[:position]
      @chefs = Chef.search_by_position(params[:position])
    else
      @chefs = Chef.all
    end
    authorize(@chefs)
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
    params.require(:chef).permit(:name, :address, :phone_number, :experience, :photo, :background_photo, :description, :price)
  end

  # def position_params
  #     params.require(:chef).permit(:position => [:title, :description, :start_date, :end_date])
  # end

end
