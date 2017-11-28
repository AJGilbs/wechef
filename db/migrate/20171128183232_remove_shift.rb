class RemoveShift < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :shift, :string
  end
end
