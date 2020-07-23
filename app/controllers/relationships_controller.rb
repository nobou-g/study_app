class RelationshipsController < ApplicationController
  before_action :set_user
  def create
    following = current_user.follow(@user)
    if following.create
      redirect_to @user
    else
      render @user
      alert('失敗しました')
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to @user
    else
      render @user
      alert('失敗しました')
    end
  end

  private
  
  def set_user
    @user= User.find(params[:relationship][:follow_id])
  end
end
