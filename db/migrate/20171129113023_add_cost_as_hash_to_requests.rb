class AddCostAsHashToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :cost, :text
  end
end
