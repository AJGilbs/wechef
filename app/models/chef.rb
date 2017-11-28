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

  def been_booked_by_restautant?(restaurant)
    bookings.any? do |b|
      b.restaurant == restaurant
    end
  end

  def self.search_by_avaiability(date)
     # take all chefs that has different id returned by Booking.where(date: date)
    self.where.not(id: Booking.where(date: date).pluck('chef_id'))
  end

end
