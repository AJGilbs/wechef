class ReviewsChefsController < ApplicationController
  before_action :find_chef
  before_action :find_review, only: [ :edit, :update, :destroy]

  def new
    @reviewChef = ReviewsChef.new
    authorize (@reviewChef)
  end

  def create
    @reviewChef = ReviewsChef.new(review_params)
    @reviewChef.chef_id = @chef.id
    @reviewChef.restaurant_id = current_restaurant.id
    authorize @reviewChef
    if @reviewChef.save!
     redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @review = ReviewsChef.find(params[:id])
    if review.update(review_params)
      # redirect_ to
    else
      render 'edit'
    end
  end

  private

  def find_chef
    @chef = Chef.find(params[:chef_id])
  end

  def find_review
    @review = ReviewsChef.find(params[:id])
  end

  def review_params
    params.require(:reviews_chef).permit(:rating, :comment)
  end
end
