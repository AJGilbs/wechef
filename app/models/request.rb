class Request < ApplicationRecord
  belongs_to :restaurant
  has_many :conversations, dependent: :destroy

  def chefs
    Chef.where(id: chef_ids)
  end


end
