class BookingsController < ApplicationController
  # to be removed
  skip_before_action :authenticate_user!

  def new
    # @roulette = policy_scope(User)
  end

end
