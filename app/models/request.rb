class Request < ApplicationRecord
  belongs_to :restaurant

  def chefs
    Chef.where(id: chef_ids)
  end
end
