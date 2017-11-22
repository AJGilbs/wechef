class AddWebsiteAddressToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :website_address, :string
  end
end
