class VideoRoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @room = Room.find(params[:id])
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @token = opentok.generate_token @room.session_id
  end

  def new; end

  def create
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    session = opentok.create_session
    
    @room = Room.new(name: 'Test', session_id: session.session_id)
    if @room.save
      format.html { redirect_to @room, notice: "Room was successfully created." }
      format.json { render :show, status: :created, location: @room }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @room.errors, status: :unprocessable_entity }
    end
  end

end
