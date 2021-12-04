class MenusController < ApplicationController
  #indexページとaページ以外は会員以外ログイン出来ない
  before_action :authenticate_user!,except: [:index,:a]

  def new
    @menu = Menu.new
    @menu.build_spot
    @usera = current_user
  end

  def create
    @menu = Menu.new(menu_params)
    @usera = current_user
    @menu.user_id = current_user.id
    if @menu.save
        tags = Vision.get_image_data(@menu.image)
      tags.each do |tag|
        @menu.tags.create(name: tag)
      end
      redirect_to menus_path
    else
      render :new
    end
  end

  def index
    @menus = Menu.all
    @usera = current_user
  end

  def show
    @menu = Menu.find(params[:id])
    @usera = current_user
    @comment = Comment.new
    @comments =@menu.comments
    @lat = @menu.spot.latitude
    @lng = @menu.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    @menu = Menu.find(params[:id])
    @usera = current_user
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
