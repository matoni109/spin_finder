class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @bikes = Bike.all
  end

  def dashboard
    @user = current_user

    authorize @user
  end

  def destinations
  end
end
