class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :bikes,  dependent: :destroy
  has_many :bookings,  dependent: :destroy
  # has_many :favourites,  dependent: :destroy
  has_one_attached :avatar

  has_many :favorite_bikes, through: :favorites, source: :favorited, source_type: 'Bike'



end
