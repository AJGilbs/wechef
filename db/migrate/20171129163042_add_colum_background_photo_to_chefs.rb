class AddColumBackgroundPhotoToChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :background_photo, :string
  end
end
