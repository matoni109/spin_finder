class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Bike.find(params[:bike_id])
    authorize @review
  end

  def create
    @review = Review.new(strong_params)
    @booking = Booking.find(params[:bike_id])
    @review.booking = @booking
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
