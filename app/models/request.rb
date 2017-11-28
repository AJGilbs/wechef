class Request < ApplicationRecord
  belongs_to :restaurant
  has_many :messages

  def chefs
    Chef.where(id: chef_ids)
  end


end
