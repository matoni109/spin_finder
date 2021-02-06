class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)

    ## maybe add a limit of 8 ?
  end

  def show
    ## set with :set_bike
    @review = Review.new()
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

  def destroy
    # gets set
    @Bike.destroy
    # no need for app/views/Bikes/destroy.html.erb
    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit( :price, :rating, :name,  :description, :location, :user_id, images: [])
  end

  def has_reviews?
    @bike.review_ids.last = nil
    return '<%= link_to "Add Review", new_bike_review_path(@bike) , class: "btn card-link " %>'
  end

end
