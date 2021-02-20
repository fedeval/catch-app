class UserBadgesController < ApplicationController

  def new
    @user_badge = UserBadge.new
  end

  def create
    @user_badge = UserBadge.new(badge_params)
  end

def badge_params
    params.require(:badge).permit(:)
  end
end
