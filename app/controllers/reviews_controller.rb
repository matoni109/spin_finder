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
    if @review.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end
end
