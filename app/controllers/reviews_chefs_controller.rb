class ReviewsChefsController < ApplicationController
  before_action :find_chef
  before_action :find_review, only: [ :edit, :update, :destroy]

  def new
    @review_chef = ReviewsChef.new
    authorize (@review_chef)
  end

  def create
    @review_chef = ReviewsChef.new(review_params)
    @review_chef.chef_id = @chef.id
    # @review_chef.restaurant_id = current_restaurant.id
    # @review_chef.booking =
    authorize @review_chef
    if @review_chef.save!
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
