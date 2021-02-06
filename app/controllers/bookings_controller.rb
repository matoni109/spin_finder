require 'date'
class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # after_action :set_total_price, only: [:create, :update]
  # def index
  #   @bookings = policy_scope(Bike).order(created_at: :desc)

  #   ## maybe add a limit of 8 ?
  # end

  # def show
  #   ## set with :set_bike
  # end

  def new
    @booking = Booking.new
    @user = current_user
    @bike = Bike.find(params[:bike_id])
    authorize @booking ## this is in set_rest
  end

  def create

    # @booking.errors.full_messages
    # @user = current_user.id
    @booking = Booking.new(booking_params)
    @booking.bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    authorize @booking


    # raise
    if @booking.valid?
      @booking.save
      set_total_price(@booking.id)
    else
      render :new
    end
    redirect_to bike_path(@booking.bike)
  end

  def edit # need to remove images / change them
    # gets set
  end

  def update
    # gets set
    @user = current_user.id
    @booking = Booking.new(booking_params)
    # @booking = booking.update!(rating: 0)

    authorize @booking

    # raise
    if @booking.valid?
      @booking.save
    else
      render :new
    end
    redirect_to bike_path(@booking.bike)

  end

  def destroy
    # gets set
    @booking.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit( :total_price, :from, :till, :user_id, :bike_id)
  end


  def set_total_price(id)
    # raise
    @booking = Booking.find(id)
    @bike = Bike.find(params[:bike_id])
    start_book = params[:booking][:from]
    end_book = params[:booking][:till]
    bike_id = params[:bike_id]

    total_days = (Date.parse(end_book)- Date.parse(start_book)).to_i

    total_price = total_days * @bike.price
    @booking.update(total_price: total_price)

  end



end
