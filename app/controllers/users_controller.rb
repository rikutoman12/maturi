class UsersController < ApplicationController
  before_action :authenticate_user!
    #いいね一覧
    before_action :set_user, only: [:likes]
  #いいね一覧
  def likes
   likes = Like.where(user_id: @user.id).pluck(:menu_id)
   @liked = Menu.find(likes)
   @usera = current_user
  end

  def show
  @user = User.find(params[:id])
  @usera = current_user
  @menus = @user.menus
  end

  def edit
  @user = User.find(params[:id])
  @usera = current_user
  end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user)
  else
    render :edit
  end
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
