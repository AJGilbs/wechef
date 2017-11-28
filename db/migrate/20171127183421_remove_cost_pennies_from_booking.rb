class RemoveCostPenniesFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :cost_pennies
  end
end
