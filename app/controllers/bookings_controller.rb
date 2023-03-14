class BookingsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  def create
    @bike = Bike.find(params[:bike_id])

    @booking = Booking.new(booking_params)
    @booking.bike = @bike

    if @booking.save
      redirect_to bike_path(@bike)
    else
      # form errors
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bike_path(@booking.bike), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:message)
  end
end
