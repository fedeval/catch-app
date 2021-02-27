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

  def index
    @badges = policy_scope(UserBadge)
  end

# def badge_params
#     params.require(:badge).permit(:)
#   end

  private
    @receiver_id = "@video_room_receiver_id"

end
