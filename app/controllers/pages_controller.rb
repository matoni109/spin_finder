class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @bikes = Bike.all
  end

  def dashboard
    @bookings = Booking.all
    @user = current_user
    @requested_bookings = Booking.joins(:bike).where(bookings: {bike_id: current_user.bikes.pluck(:id)})
    authorize @user
  end
end
