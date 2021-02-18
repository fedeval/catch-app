class RouletteController < ApplicationController
  # to be removed
  skip_before_action :authenticate_user!

  def index
    # check if proper
    @roulette = policy_scope(User)
  end

end
