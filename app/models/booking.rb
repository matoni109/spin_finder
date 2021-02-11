class Booking < ApplicationRecord
  validate :own_bike?, on: :create
  validates :from, :till, presence: true
  validate :end_date_after_start_date
  ## before create

  belongs_to :user
  belongs_to :bike
  has_many :reviews, dependent: :destroy


  ## TODO User can not book his own bike

  private

  def end_date_after_start_date
    return if till.blank? || from.blank?

    if till < from
      errors.add(:till, "must be after the start date")
    end
  end

  def own_bike?
    if bike.user.id == user_id
      errors.add(:bike, "You can't book your own bike")
    end
  end

end

# https://github.com/seejohnrun/ice_cube
# https://teamtreehouse.com/community/bookings-in-ruby-on-rails
# t.datetime "from"
# t.datetime "till"
