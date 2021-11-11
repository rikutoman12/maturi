class LikesController < ApplicationController

def create
  @menu = Menu.find(params[:menu_id])
  @like = current_user.likes.new(menu_id:@menu.id)
  @like.menu_id = @menu.id
  @like.save
  redirect_to menu_path(@menu)
end

def destroy
  @menu = Menu.find(params[:menu_id])
  @like = current_user.likes.find_by(menu_id:@menu.id)
  @like.menu_id = @menu.id
  @like.destroy
  redirect_to menu_path(@menu)
end

end
