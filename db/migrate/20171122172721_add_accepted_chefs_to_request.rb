class AddAcceptedChefsToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :accepted_chef_ids, :integer, array: true, default: []
  end
end
