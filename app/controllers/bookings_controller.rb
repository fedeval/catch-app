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

    create_video_room(@booking)

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

  def create_video_room(booking)
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    session = opentok.create_session

    video_room = VideoRoom.new(session_id: session.session_id)
    video_room.booking = booking
    video_room.save
  end
end
