class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update destroy]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    render json: @booking
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:time, :date, :user_id, :doctor_id)
  end
end
