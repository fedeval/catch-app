class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(params[:chatroom])
    @chatroom.save
    authorize @chatroom

    redirect_to chatroom_path(@chatroom)
  end
end
