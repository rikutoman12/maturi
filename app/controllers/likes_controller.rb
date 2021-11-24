class LikesController < ApplicationController
  before_action :authenticate_user!

def create
  @menu = Menu.find(params[:menu_id])
  @like = current_user.likes.new(menu_id:@menu.id)
  @like.menu_id = @menu.id
  @like.save
end

def destroy
  @menu = Menu.find(params[:menu_id])
  @like = current_user.likes.find_by(menu_id:@menu.id)
  @like.menu_id = @menu.id
  @like.destroy
end

end
