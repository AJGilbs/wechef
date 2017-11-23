class AddColumnStartHourToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_hours, :integer
    add_column :bookings, :end_hours, :integer
  end
end
