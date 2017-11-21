class AddFieldsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :photo, :string
  end
end
