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
end
