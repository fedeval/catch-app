class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking)
    @booking = Booking.new
  end

  def create
    booking_params = params[:timepicker].split(':').map(&:to_i)
    @booking = Booking.new(start_hour: booking_params[0], start_minutes: booking_params[1])
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
end
