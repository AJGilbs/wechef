class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :restaurant, foreign_key: true
      t.references :chef, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
