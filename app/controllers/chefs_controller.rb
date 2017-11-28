class ChefsController < ApplicationController
  before_action :authenticate_chef!, except: [:index, :show, :search]
  before_action :find_chef, only: [:create, :edit, :update, :show]

  def index #should show only 6 randon chefs
    @chefs = policy_scope(Chef)
  end

  def show

    @request = Request.new
    authorize(@chef)
    authorize(@request)
  end

  def search
    if params[:date] != ""
      date = Date.parse(params[:date])
      @chefs = Chef.search_by_avaiability(date)
    else
      @chefs = Chef.all
    end
    if params[:position]
      @chefs = filter_by_position(@chefs, params[:position])
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
    params.require(:chef).permit(:name, :addres, :phone_number, :experience, :photo, :description, :price)
  end

  # def position_params
  #     params.require(:chef).permit(:position => [:title, :description, :start_date, :end_date])
  # end

  def filter_by_position(chefs, position)
    chefs.select do |chef|
      chef.positions.find {|p| p.title = position}
    end
  end
end
