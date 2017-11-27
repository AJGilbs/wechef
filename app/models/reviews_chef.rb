class ReviewsChef < ApplicationRecord
  belongs_to :chef
  belongs_to :booking
end
