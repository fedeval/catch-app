class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking)
  end

  def create; end

  def update; end

  private

  def booking_params; end
end
