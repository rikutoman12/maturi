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
  end

  def update
  end

  def destroy
  end

  private
  def menu_params
     params.require(:menu).permit(:title,:body,:user_id,:image)
  end
end
