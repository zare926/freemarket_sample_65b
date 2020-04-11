class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: comment_params[:text],item_id: comment_params[:item_id],user_id: current_user.id)
    if @comment.save
      redirect_to item_path
    else
      render : new
    end
  end

  def new
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,item_id: params[:id])
  end
end