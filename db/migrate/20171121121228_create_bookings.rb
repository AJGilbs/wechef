class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :restaurant, foreign_key: true
      t.references :chef, foreign_key: true
      t.date :date
      t.string :shift

      t.timestamps
    end
  end
end
