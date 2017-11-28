class AddStateOnBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :status, :string, default: 'unpaid'
  end
end
