class AddNumberOfChefsToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :number_of_chefs, :integer
  end
end
