class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = current_user
    @user = policy_scope(User).where(id: current_user.id).first
    # @user = policy_scope(User)
    # @user_badges = @badges.select {|badge| badge.user == @user }
    @bookings = Booking.where("user_one_id = ? or user_two_id = ?", @user.id, @user.id)
  end
end
