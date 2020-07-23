class UsersController < ApplicationController
  before_action :set_params, only: :show
  def show
    events= @user.events
    @events= events.reverse()
  end

  private

  def set_params
    @user= User.find(params[:id])
  end
end
