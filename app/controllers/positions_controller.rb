class PositionsController < ApplicationController

  # def new
  #   @position = Position.new
  #   authorize(@position)
  # end

  def create
    @position = Position.new(position_params)
    @position.chef = current_chef
    authorize(@position)
    if @position.save
      redirect_to edit_chef(@chef)
    else
      render "new"
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
