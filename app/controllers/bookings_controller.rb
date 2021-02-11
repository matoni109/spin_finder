require 'date'
class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]

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
    @bike = Bike.find(params[:bike_id])
    # @booking.errors.full_messages
    # @user = current_user.id
    @booking = Booking.new(booking_params)
    @booking.bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    authorize @booking


    # raise
    if @booking.valid?
      @booking.save
      set_total_price(@booking.id) ## call method
      redirect_to dashboard_path
    else
      flash[:alert] = @booking.errors.full_messages.to_sentence
      render :new
    end

  end

  def edit # need to remove images / change them
    # gets set
  end

  def update
    @booking = Booking.find(params[:id])
    @bike = @booking.bike_id
    @booking.user = current_user
    # @booking.errors.full_messages
    # @user = current_user.id

    # @booking.bike = Bike.find(params[:bike_id])
    authorize @booking


    if @booking.valid?
      @booking.update(till: params["booking"][:till], from: params["booking"][:from])
      set_total_price(@booking.id) ## call method
      redirect_to dashboard_path
    else
      render :new
    end

  end

  def destroy
    # gets set
    @booking.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit( :total_price, :from, :till, :user_id, :bike_id)
  end

  def set_total_price(id)
    # raise
    @booking = Booking.find(id)
    # @bike = @booking.bike_id
    start_book = params[:booking][:from]
    end_book = params[:booking][:till]

    total_days = (Date.parse(end_book)- Date.parse(start_book)).to_i

    total_price = total_days * @booking.bike.price
    @booking.update(total_price: total_price)

  end
end
