class BookingsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
    authorize @booking
  end

  def approve
    @booking = Booking.find(params[:id])
    # @bike = Bike.find(params[:bike_id])
    @booking.update(state: true)
    flash[:success] = "Booking successfully approved"
    authorize @booking
    redirect_to booking_path(@booking)
  end

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
    @bikes = current_user.my_booked_bikes.uniq
    authorize @bookings
  end

  # def my_bikes
  #   @bookings = Bike.joins(:bookings).where(bookings: { user_id: current_user.id })
  # end

  private

  def booking_params
    params.require(:booking).permit(:message, :start_time, :end_time)
  end
end
