class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(item_id: params[:id])
  end
end
