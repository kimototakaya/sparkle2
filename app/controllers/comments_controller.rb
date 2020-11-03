class CommentsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post_id = params[:post_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:message).merge(post_id: params[:post_id])
  end
    # if @comment.save
    #   redirect_to post_path(@post_id), notice: '投稿しました'
    # else
    #   render 'comments/new', alert: '投稿できませんでした'
    # end
end
