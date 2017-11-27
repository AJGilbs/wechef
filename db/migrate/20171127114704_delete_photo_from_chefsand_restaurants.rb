class DeletePhotoFromChefsandRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :photo
    remove_column :chefs, :photo
  end
end
