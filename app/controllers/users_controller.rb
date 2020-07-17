class UsersController < ApplicationController
  before_action :set_params, only: :show
  def show
  end

  private

  def set_params
    @user= User.find(params[:id])
  end
end
