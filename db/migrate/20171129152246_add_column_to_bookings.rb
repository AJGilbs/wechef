class AddColumnToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_hours, :time
    add_column :bookings, :end_hours, :time
  end
end
