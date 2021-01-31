class Review < ApplicationRecord
  belongs_to :booking


  ## TODO User can not Review his own bike
end
