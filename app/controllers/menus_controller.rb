class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menus_path
  end

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu = destroy
    redirect_to menus_path
  end

  private
  def menu_params
     params.require(:menu).permit(:title,:body,:user_id,:image)
  end
end
