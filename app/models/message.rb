class Message < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates_presense_of :body, :author_id

  def message_time
      create_at.strftime("%m/%d/%y at %l:%M %p")
  end

end
