class RemoveColumnFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :start_hours
    remove_column :bookings, :end_hours
  end
end
