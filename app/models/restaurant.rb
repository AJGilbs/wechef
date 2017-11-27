class Restaurant < ApplicationRecord
  has_many :bookings
  has_many :requests
  has_many :reviewsRestaurant
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
