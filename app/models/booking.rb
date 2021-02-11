class Booking < ApplicationRecord
  validate :own_bike?, on: :create
  ## before create

  belongs_to :user
  belongs_to :bike
  has_many :reviews, dependent: :destroy

  ## TODO User can not book his own bike

  def own_bike?
    if @bike.user_id == user_id
      errors.add(:bike, "can't be your own bike")
    end
  end
end

# https://github.com/seejohnrun/ice_cube
# https://teamtreehouse.com/community/bookings-in-ruby-on-rails
