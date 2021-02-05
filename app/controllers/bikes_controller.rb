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

    authorize @bike ## this is in set_rest
  end

  def create

    # @bike.errors.full_messages
    @user = current_user.id
    @bike = Bike.new(bike_params)
    @bike = Bike.update!(rating: 0)
    @bike.images.attach(params[:bike][:images])

    authorize @bike

    # raise
    if @bike.valid?
      @bike.save
    else
      render :new
    end
    redirect_to bikes_path(@bike)
  end

  def edit # need to remove images / change them
    # gets set
  end

  def update
    # gets set
    @user = current_user.id
    @bike = Bike.new(bike_params)
    # @bike = Bike.update!(rating: 0)
    @bike.images.attach(params[:bike][:images])

    authorize @bike

    # raise
    if @bike.valid?
      @bike.save
    else
      render :new
    end
    redirect_to bikes_path(@bike)

  end


  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit( :price, :rating, :name,  :description, :location, :user_id, images: [])
  end

end
