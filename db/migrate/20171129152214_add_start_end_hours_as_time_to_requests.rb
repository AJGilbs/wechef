class AddStartEndHoursAsTimeToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :start_hours, :time
    add_column :requests, :end_hours, :time
  end
end
