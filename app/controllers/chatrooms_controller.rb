class ChatroomsController < ApplicationController
  def show
    other_user = booking.user_one == current_user ? booking.user_two : booking.user_one
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
