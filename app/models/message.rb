class Message < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates :body, :author_id, presence: true

  def message_time
      create_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
