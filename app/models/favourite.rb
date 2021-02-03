class Favourite < ApplicationRecord
  # belongs_to :bike
  belongs_to :favorited, polymorphic: true
  belongs_to :user
  ## TODO User can not Favourite a bike twice
  # validates :user, uniqueness: { scope: :bike }
  validates :user_id, uniqueness: { scope: [:favorited, :favorited_id] }

end
