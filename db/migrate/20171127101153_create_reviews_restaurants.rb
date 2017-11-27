class CreateReviewsRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews_restaurants do |t|
      t.integer :rating
      t.text :comment
      t.references :booking, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
