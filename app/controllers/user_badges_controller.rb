class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def assign
    badge = Badge.find_by(category: params[:category])
    booking = Booking.find(params[:booking])
    user_badge = UserBadge.new(
      receiver: booking.user_one == current_user ? booking.user_two : booking.user_one,
      sender: current_user,
      badge: badge
    )
    authorize user_badge
    redirect_to dashboard_index_path if user_badge.save
  end
end
