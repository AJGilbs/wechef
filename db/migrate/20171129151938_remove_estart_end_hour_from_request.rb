class RemoveEstartEndHourFromRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :start_hours
    remove_column :requests, :end_hours
  end
end
