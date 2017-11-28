class ChangeReferenceInMessage < ActiveRecord::Migration[5.1]
  def change
    remove_reference :messages, :request
    add_reference :messages, :conversation, foreign_key: true
  end
end
