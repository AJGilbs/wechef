class ReviewsRestaurant < ApplicationRecord
  belongs_to :booking
  belongs_to :restaurant
end
