class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.integer :chef_ids, array: true, default: []
      t.date :date
      t.string :shift
      t.integer :cost_pennies, default: 0, null: false
      t.timestamps
    end
  end
end
