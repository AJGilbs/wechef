class PositionsController < ApplicationController


  def create
    @chef = current_chef
    @position = Position.new(position_params)
    @position.chef = current_chef
    authorize(@position)
    if @position.save
      render "/chefs/edit"
    else
      render "new"
    end
  end

  def destroy
    @chef = current_chef
    @position = Position.find(params[:id])
    authorize(@position)
    @position.destroy
    redirect_to edit_chef_path(@chef)
  end

  private
  def position_params
    params.require(:position).permit(:title, :restaurant_name, :description, :start_date, :end_date)
  end
end
