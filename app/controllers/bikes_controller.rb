class BikesController < ApplicationController
  # before_action :bike_params only: [:show]


  def index
  end

  def show
    @bike = Bike.find(params[:id])
  end

  private

  def bike_params
    @bike = Bike.find(params[:id])
  end
end
