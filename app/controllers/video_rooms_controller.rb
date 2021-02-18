class VideoRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @room = VideoRoom.find(params[:id])
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @token = opentok.generate_token @room.session_id
  end

  def new; end

  def create
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    session = opentok.create_session
    
    @room = VideoRoom.new(name: 'Test', session_id: session.session_id)
    if @room.save
      render :show
    else
      render root_path
    end
  end

end
