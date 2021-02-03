class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  #associations
  has_many :bikes,  dependent: :destroy
  has_many :bookings,  dependent: :destroy
  # OLD SCHEMA : has_many :favourites,  dependent: :destroy
  has_many :favorite_bikes, through: :favorites, source: :favorited, source_type: 'Bike'

  #images
  has_one_attached :avatar
end
