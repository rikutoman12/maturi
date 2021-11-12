class UsersController < ApplicationController
    #いいね一覧
    before_action :set_user, only: [:likes]
  #いいね一覧
  def likes
   likes = Like.where(user_id: @user.id).pluck(:menu_id)
   @liked = Menu.find(likes)
  end

  def show
  @user = User.find(params[:id])
  @menus = @user.menus
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user)
  end

  private
  def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
  end

  #いいね一覧機能
  def set_user
    @user = User.find(params[:id])
  end
end
