class DeleteCostAsMoneyFromRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :cost_pennies
  end
end
