class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_badge = UserBadge.new
    authorize @user_badge
  end

  def create
    @user_badge = UserBadge.new(receiver_id, badge)
    authorize @user_badge
  end

  def assign
    badge = Badge.find_by(category: params[:category])
    booking = Booking.find(params[:booking])
    user_badge = UserBadge.new(
      receiver: booking.user_one == current_user ? booking.user_two : booking.user_one,
      sender: current_user,
      badge: badge
      )
    authorize user_badge
    if user_badge.save
      redirect_to dashboard_index_path
    end
  end

  def index
    @badges = policy_scope(UserBadge)
  end

# def badge_params
#     params.require(:badge).permit(:)
#   end

  # private
  # def user_badges_params
  #   params.require(:booking).permit(:category, :booking)
  # end
end
