class BookingsController < ApplicationController
    def create
        @car = Car.find(params[:car_id])
        @booking = Booking.new(booking_params)
        @booking.car = @car
        @booking.user = current_user
        if @booking.save
            redirect_to car_path(@car)
        else
            render "new"
        end
    end
    private 
    def booking_params
        params.require(:booking).permit(:checking_date, :checkout_date)
    end
end

