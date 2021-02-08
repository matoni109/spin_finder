class User < ApplicationRecord
  # has_attached_file :avatar, default_url: "default.png"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_commit :add_default_avatar, on: %i[create update]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  #associations
  has_many :bikes,  dependent: :destroy
  has_many :bookings,  dependent: :destroy
  # OLD SCHEMA : has_many :favourites,  dependent: :destroy
  has_many :favorite_bikes, through: :favorites, source: :favorited, source_type: 'Bike'

  #images
  has_one_attached :avatar

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default.jpeg'
          )
        ),
        filename: 'default.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
