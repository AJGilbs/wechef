class AddColumBackgroundPhotoToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :background_photo, :string
  end
end
