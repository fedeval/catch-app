class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking)
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_one = current_user
    authorize(@booking)

    if @booking.save
      redirect_to dashboard_index_path
    else
      render 'bookings/index'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.user_two = current_user
    authorize(@booking)
    if @booking.save
      redirect_to dashboard_index_path
    else
      render 'bookings/index'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time)
  end
end