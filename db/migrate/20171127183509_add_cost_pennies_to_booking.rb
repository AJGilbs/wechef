class AddCostPenniesToBooking < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :cost, currency: { present: false }
  end
end
