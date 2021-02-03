class Favourite < ApplicationRecord
  # belongs_to :bike
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  ## TODO User can not Favourite a bike twice
  # validate users_id where favoured type "BIKE" and favorited_id ( the bikes ID )
  validates :user_id, uniqueness: { scope: [:favorited, :favorited_id] }

end
