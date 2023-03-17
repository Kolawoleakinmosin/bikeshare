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

    if current_user == @bike.user
      redirect_to @bike, alert: "You cannot book your own bike."
    elsif @booking.save
      redirect_to confirmation_path(@booking)
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

  def confirmation
    @booking = Booking.find(params[:id])
    @bike = @booking.bike
    authorize @booking

    if params[:confirm_booking]
      @booking.save
      if @booking.save
        redirect_to my_bookings_path, notice: 'You have successfully booked this bike.'
      else
        render :new
      end

    end
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :start_time, :end_time)
  end
end
