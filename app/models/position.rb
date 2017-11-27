class Position < ApplicationRecord
  belongs_to :chef

  validates :title, presence: true, inclusion: { in: ["Executive Chef", "Head Chef", "Sous Chef", "Chef de Partie", "Commis Chef"]}
  validates :start_date, :end_date, presence: true
end
