class ReviewsRestaurantController < ApplicationController
  before_action :find_restaurant
  before_action :find_review, only: [ :edit, :update, :destroy]

  def new
 restaurant = ReviewsRestaurant.new
    authorize (@review_restaurant)
  end

  def create
    @review_restaurant = ReviewsRestaurant.new(review_params)
    @review_restaurant.restaurant = @restaurant
    @review_restaurant.booking = current_restaurant.bookings.where(restaurant: @restaurant).last

    authorize @review_restaurant
    if @review_restaurant.save!
     redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @review = ReviewsRestaurant.find(params[:id])
    if review.update(review_params)
      # redirect_ to
    else
      render 'edit'
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_review
    @review = ReviewsRestaurant.find(params[:id])
  end

  def review_params
    params.require(:reviews_restaurant).permit(:rating, :comment)
  end

end
