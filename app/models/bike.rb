class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address

  # has_many :favourites, dependent: :destroy

  ## through ass
  has_many :reviews, through: :bookings, dependent: :destroy

  ## validations :
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_float: true }
  validates :address, presence: true
  validates :price, presence: true
  validates :times_booked, numericality: { only_integer: true }
  after_validation :geocode, if: :will_save_change_to_address?
  ## Images
  has_many_attached :images

end
