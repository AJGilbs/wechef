class RequestsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :request
  end
end
