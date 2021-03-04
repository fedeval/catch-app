class FriendshipsController < ApplicationController

  def add_friend
    booking = Booking.find(params[:booking_id])
    other_user = booking.user_one == current_user ? booking.user_two : booking.user_one
    current_user.friend_request(other_user)
    authorize(booking)
  end

  # def on_friendship_accepted(friendship)

  # end

  # def on_friendship_blocked(friendship)

  # end

  # def on_friendship_destroyed(friendship)

  # end
end


# https://github.com/sungwoncho/has_friendship  >> all functionalities
