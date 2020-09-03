# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user =User.new
  end
  
  def create
    @user =User.new(user_params)
    if @user.save
      bypass_sign_in(@user)
      redirect_to root_path, notice: "ユーザー「#{@user.nickname}」を登録しました。"
    else
      render 'new'
    end
  end

  def edit
    @user= User.find(user_id: current_user.id)
  end

 
  private
  def user_params
    params.require(:user).permit(:nickname,:email,:password, :affiliation, :introduction)
  end
end
