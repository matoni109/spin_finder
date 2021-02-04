class Review < ApplicationRecord
  belongs_to :booking
  ## validations :
  validates :content, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }

  ## TODO User can not Review his own bike

end
