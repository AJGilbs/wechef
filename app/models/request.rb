class Request < ApplicationRecord
  belongs_to :restaurant
  has_many :conversations, dependent: :destroy

  validates_presence_of :date, :number_of_chefs, :description, :start_hours, :end_hours
  validate :start_hour_must_be_before_end_hour
  validate :date_cannot_be_in_the_past
  
  serialize :cost, Hash

  def chefs
    Chef.where(id: chef_ids)
  end

  private

  def start_hour_must_be_before_end_hour
    errors.add(:start_hours, 'must be before end hours') if start_hours > end_hours
  end

  def date_cannot_be_in_the_past
    errors.add(:date, "Can't be in the past!") if date < Time.now
  end
end
