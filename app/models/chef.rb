class Chef < ApplicationRecord
  has_many :bookings
  has_many :requests
  has_many :reviews_chef
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  monetize :price_pennies
  mount_uploader :photo, PhotoUploader

  def been_booked_by_restautant?(restaurant)
    bookings.any? do |b|
      b.restaurant == restaurant
    end
  end
end
