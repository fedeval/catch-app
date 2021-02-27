class VideoRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @video_room = VideoRoom.find(params[:id])
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @token = opentok.generate_token @video_room.session_id
    authorize @video_room
  end

  def end
    @video_room = VideoRoom.find(params[:id])
    @booking = @video_room.booking
    @badges = Badge.all
    authorize @video_room
  end


  # def create
  #   opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
  #   session = opentok.create_session

  #   @room = VideoRoom.new(session_id: session.session_id)
  #   authorize @room

  #   if @room.save
  #     redirect_to video_room_path(@room)
  #   else
  #     redirect_to dashboard_index_path
  #   end
  # end
end
