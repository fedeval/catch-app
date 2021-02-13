class RouletteController < ApplicationController
  def index
    @users = User.all
  end
end
