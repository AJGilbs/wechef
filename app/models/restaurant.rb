class Restaurant < ApplicationRecord
  has_many :bookings
  has_many :requests
  has_many :reviews_restaurant
  validates :email, presence: true, format: { with: /\A.*@.*\.*\z/ }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader
  mount_uploader :background_photo, PhotoUploader

   def booked_chef?(chef)
    bookings.any? do |b|
      b.chef == chef
    end
  end

  def average_rating
    return 0 if reviews_restaurant.empty?

    (reviews_restaurant.reduce(0) { |a, e| a + e.rating } / reviews_restaurant.length).ceil
  end
end
