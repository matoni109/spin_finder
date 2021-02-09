class Review < ApplicationRecord
  belongs_to :booking
  ## validations :
  validates :content, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }

  ##sorts out calculating the users rating
  # after_commit :add_default_avatar, on: %i[create update]

  ## TODO User can not Review his own bike
  private


end
