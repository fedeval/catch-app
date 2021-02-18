class VideoRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @room = VideoRoom.find(params[:id])
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @token = opentok.generate_token @room.session_id
    authorize @room
  end

  def new; end

  def create
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    session = opentok.create_session
    
    @room = VideoRoom.new(name: 'Test', session_id: session.session_id)
    authorize @room

    if @room.save
      redirect_to video_room_path(@room)
    else
      redirect_to root_path
    end
  end

end
