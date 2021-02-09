class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end

  def create
    @review = Review.new(strong_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @bike = @booking.bike
    authorize @bike
    @bike_up = Bike.find(@booking.bike.id)


    # Binding.pry
    if @review.save
      ## goes and updades the bikes rating
      @bike_rate = calculate_bike_rating(@bike.reviews)
      @bike_up.update!(rating: @bike_rate)
      # binding.pry
      redirect_to bike_path(@bike)
    else

      render :new
    end
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end

  def calculate_bike_rating(bike)
    count = 0
    bike.each do |bikes|
      count += bikes.rating
    end
    average = (count / bike.length).to_f.round(2)
  end
end
