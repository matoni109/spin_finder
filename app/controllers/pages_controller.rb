class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @bikes = Bike.all
  end

  def dashboard
    @bookings = Booking.all
    #
    @user = current_user

    @requested_bookings = Booking.joins(:bike).where(bookings: {bike_id: current_user.bikes.pluck(:id)})
    
    authorize @user
  end
end

# Restaurant.where("rating >= 4").order(rating: :asc).first(5)

# Restaurant.where('title LIKE :query AND category = :category', query: params[query], category: "Rock")

# Restaurant.find_by(title: params[:query])
