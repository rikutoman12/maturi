class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = current_user.comments.new(comment_params)
    @comment.menu_id = @menu.id
    @comment.save
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    @menu = Menu.find(params[:menu_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comm)
  end

end
