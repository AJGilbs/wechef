class Request < ApplicationRecord
  belongs_to :restaurant
  has_many :conversations, dependent: :destroy

  serialize :cost, Hash

  def chefs
    Chef.where(id: chef_ids)
  end


end
