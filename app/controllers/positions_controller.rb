class PositionsController < ApplicationController

  def create
    @position = Position.new(position_params)
    @position.chef = current_chef
    authorize(@position)
    if not @position.save
      render edit_chef(@chef)
    end
  end

  def destroy
    @position = Position.find(params[:id])
    authorize(@position)
    @position.destroy
  end

  private
  def position_params
    params.require(:position).permit(:title, :description, :start_date, :end_date)
  end
end
