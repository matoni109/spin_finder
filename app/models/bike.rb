class Bike < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :favourites
  has_many :bookings
end
