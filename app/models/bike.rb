class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :favourites, dependent: :destroy

  ## through ass
  has_many :reviews, through: :bookings, dependent: :destroy

  ## validations :
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }
  validates :times_booked, numericality: { only_integer: true }
  ## Images
  has_many_attached :images


  ## Image methods
  def cloudinary_imgs(key)
    cl_image_tag(key, :height=>200, :quality=>"auto", :fetch_format=>:auto, :transformation => { :dpr => "auto", :responsive => true, :width => "auto", :crop => "scale", })
  end
end
