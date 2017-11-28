class Booking < ApplicationRecord
  belongs_to :chef
  belongs_to :restaurant

  monetize :cost_pennies
end
