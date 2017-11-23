class AddColumnStartHourToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :start_hours, :integer
    add_column :requests, :end_hours, :integer

  end
end
