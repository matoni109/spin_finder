class BikesController < ApplicationController

  before_action :set_bike, only: [:show, :edit, :update, :destroy]


  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
  end

  def show
    ## set with :set_bike
  end

  def new
    @bike = Bike.new
    @user = current_user
    authorize @bike ## this is in set_rest
  end

  def create
    # [...]
    @bike = Bike.new(bike_params)
    authorize @bike


    # raise
    if @bike.valid?
      @bike.save
    else
      raise
      render :new
    end
    redirect_to bikes_path(@bike)
  end



  def update


  end


  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit(:price, :name, :images, :available, :description, :location  )
  end

end
