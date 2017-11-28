class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews_chefs do |t|
      t.integer :rating
      t.text :comment
      t.references :chef, index:true, foreign_key: true
      t.references :booking, index:true, foreign_key: true

      t.timestamps
    end
  end
end
