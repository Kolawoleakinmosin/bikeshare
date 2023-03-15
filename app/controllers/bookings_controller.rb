class BookingsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
    authorize @booking
  end

  # def bookings
  #   # people that have booked my bike
  #   @bikes = current_user.bikes
  #   # need to iterate over bikes, get bike and its booking
  # end

  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to bike_path(@bike), notice: 'You Have Successfully Booked This Bike'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bike_path(@booking.bike), status: :see_other
  end

  def mybookings

    @bookings = Booking.joins(:bike).where(bikes: { user_id: current_user.id })
    authorize @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :date_start, :date_end)
  end
end
