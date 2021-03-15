class FriendshipsController < ApplicationController
  def add_friend
    booking = Booking.find(params[:booking_id])
    other_user = booking.user_one == current_user ? booking.user_two : booking.user_one
    current_user.friend_request(other_user)
    authorize(booking)
  end

  def accept_request
    contact = User.find(params[:contact_id])
    current_user.accept_request(contact)
    authorize(contact)
    redirect_to dashboard_index_path(view: "contacts")
  end

  def decline_request
    contact = User.find(params[:contact_id])
    current_user.decline_request(contact)
    authorize(contact)
    redirect_to dashboard_index_path(view: "contacts")
  end
end
