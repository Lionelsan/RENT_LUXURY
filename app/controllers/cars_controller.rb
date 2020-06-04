class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  # We got a button Details for it render to
  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  #Creation Car
  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path(@car)
    else
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  #We got and Edit button for it render to edit_car_path
  def update
    @car = Car.find(params[:id])
    @car.update(car_params)

    redirect_to car_path(@car)
  end

  #We got a a Destroy button render to car_path(index)
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:model, :brand, :year, :description, :place, :price_per_day, :photo)
  end
end
