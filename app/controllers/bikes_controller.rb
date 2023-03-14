class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @bikes = policy_scope(Bike)
  end

  def mybikes
    @bikes = current_user.bikes
    authorize @bikes
  end

  def show
    authorize @bike
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike

    if @bike.save
      redirect_to @bike, notice: "Bike listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @bike
  end

  def update
    authorize @bike
    if @bike.update(bike_params)
      redirect_to @bike, notice: "Bike listing was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to bikes_url, notice: "Bike was successfully destroyed."
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:title, :location, :price, photos: [])
  end
end
