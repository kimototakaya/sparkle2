class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:message).merge(post_id: params[:post_id])
  end
end
