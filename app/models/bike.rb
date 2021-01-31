class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :favourites, dependent: :destroy

  ## through ass
  has_many :reviews, through: :bookings, dependent: :destroy

  ## Images
  has_many_attached :images
end
