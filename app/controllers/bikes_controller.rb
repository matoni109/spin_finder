class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    # params from HOME
    if params.has_key?(:search) && params[:search][:query].present?
      @results = Geocoder.search(params[:search][:query]).first.coordinates
      # find bikes NEAR the geo
      # @bikes is now ready to parse =>
      @bikes = policy_scope(Bike).near(@results, 20)
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @bikes.geocoded.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { bike: bike })
        }
      end

    else
      @bikes = policy_scope(Bike).order(created_at: :desc)
      @markers = @bikes.geocoded.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { bike: bike })
        }
      end
    end
  end

  def show
    # set with :set_bike
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
    @bike.update(rating: 0, user_id: @user)
    @bike.images.attach(params[:bike][:images])

    authorize @bike

    # raise
    if @bike.valid?
      @bike.save
      redirect_to dashboard_path
    else
      render :new
    end
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
      redirect_to dashboard_path
    else
      render :new
    end
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
