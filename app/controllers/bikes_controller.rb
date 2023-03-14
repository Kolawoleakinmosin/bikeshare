class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      redirect_to @bike, notice: "Bike listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: "Bike listing was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end


  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:title, :location, :price)
  end
end
