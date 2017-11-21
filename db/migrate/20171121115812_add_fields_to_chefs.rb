class AddFieldsToChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :name, :string
    add_column :chefs, :address, :string
    add_column :chefs, :phone_number, :string
    add_column :chefs, :photo, :string
    add_column :chefs, :experience, :string
    add_column :chefs, :description, :string
    add_column :chefs, :avg_rating, :float
  end
end
