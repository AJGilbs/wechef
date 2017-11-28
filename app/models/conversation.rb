class Conversation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :chef
  belongs_to :request

  has_many :messages, dependent: :destroy

  def self.between(chef, restaurant)
    Conversation.find_by(chef: chef, restaurant: restaurant)
  end
end
