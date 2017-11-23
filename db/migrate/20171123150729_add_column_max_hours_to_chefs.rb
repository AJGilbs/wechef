class AddColumnMaxHoursToChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :max_hours, :integer
  end
end
