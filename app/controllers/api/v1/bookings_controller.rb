class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :update, :destroy]
  before_action :set_booking, only: [:update, :destroy]

  def index
    bookings = current_user.bookings
    render json: { bookings: bookings }, status: :ok
  end

  def create
    booking = Booking.new(user: current_user, **booking_params)
    if booking.save
      render json: { result: 'success', booking: booking }, status: :created
    else
      render json: { result: 'failed', error: booking.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: { result: 'success', booking: @booking }, status: :ok
    else
      render json: { result: 'failed', error: @booking.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    render json: { result: 'success' }, status: :ok
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:bookingdate, :is_active, :duration, :doctor_id)
  end
end
