class Chef < ApplicationRecord
  has_many :bookings
  has_many :requests
  has_many :positions
  has_many :reviews_chef

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  monetize :price_pennies
  mount_uploader :photo, PhotoUploader
  mount_uploader :background_photo, PhotoUploader

  def been_booked_by_restautant?(restaurant)
    bookings.any? do |b|
      b.restaurant == restaurant
    end
  end

  def self.search_by_position(position)
    self.joins(:positions).where("positions.title" => position)
  end


  def experience_percentage
    if experience == "Less than 1 year"
      return "17%"
    elsif experience == "1 year"
      return "35%"
    elsif experience == "2 years"
      return "70%"
    elsif experience == "3 years or more"
      return "100%"
    else
      return "1%"
    end
  end

  def average_rating
    return 0 if reviews_chef.empty?

    (reviews_chef.reduce(0) { |a, e| a + e.rating } / reviews_chef.length).ceil
  end

end
