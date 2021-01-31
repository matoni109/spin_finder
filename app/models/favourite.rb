class Favourite < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :user, uniqueness: { scope: :bike }
end
