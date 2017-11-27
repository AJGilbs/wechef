class AddPhotToRestaurantsAndChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :photo, :string
    add_column :chefs, :photo, :string
  end
end
