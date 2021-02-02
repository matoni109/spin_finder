class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :bike
  has_many :reviews,  dependent: :destroy

  ## TODO User can not book his own bike
  # owner => booking.bike.user.id != user_id
  # validates :bike, uniqueness: { scope: :bike,  message: "you can't book your own bike :| "}
end

# https://github.com/seejohnrun/ice_cube
# https://teamtreehouse.com/community/bookings-in-ruby-on-rails
