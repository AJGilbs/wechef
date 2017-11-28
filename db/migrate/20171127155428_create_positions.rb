class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :chef, foreign_key: true

      t.timestamps
    end
  end
end
