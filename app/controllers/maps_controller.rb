class MapsController < ApplicationController
  def index
    @users = User.all
    gon.users = User.all
  end
end
