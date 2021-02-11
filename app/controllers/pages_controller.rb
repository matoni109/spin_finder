class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @bikes = Bike.all
  end

  def dashboard
    @bookings = Booking.all
    @user = current_user

    authorize @user
  end
end
