class MenusController < ApplicationController
  #indexページとaページ以外は会員以外ログイン出来ない
  before_action :authenticate_user!,except: [:index,:a]

  def new
    @menu = Menu.new
    @menu.build_spot
    @user = current_user
  end

  def create
    @menu = Menu.new(menu_params)
    @user = current_user
    @menu.user_id = current_user.id
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  def index
    @menus = Menu.all
    @user = current_user
  end

  def show
    @menu = Menu.find(params[:id])
    @user = current_user
    @comment = Comment.new
    @comments =@menu.comments
    @lat = @menu.spot.latitude
    @lng = @menu.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    @menu = Menu.find(params[:id])
    @user = current_user
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menu_path(@menu)
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private
  def menu_params
    params.require(:menu).permit(:title,:body,:user_id,:image,:menu_id,spot_attributes: [:address])
  end
end
