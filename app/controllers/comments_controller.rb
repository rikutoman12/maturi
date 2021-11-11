class CommentsController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = current_user.comments.new(comment_params)
    @comment.menu_id = @menu.id
    @comment.save
    redirect_to menu_path(@menu)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to menu_path(params[:menu_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comm)
  end

end
