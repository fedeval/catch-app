class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def assign
    badge = Badge.find_by(category: params[:category])
    booking = Booking.find(params[:booking])
    user_badge = UserBadge.create(
      receiver: booking.user_one == current_user ? booking.user_two : booking.user_one,
      sender: current_user,
      badge: badge
    )
    authorize user_badge
  end
end
