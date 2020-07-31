class CommentsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post_id = params[:post_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @post_id = params[:post_id]
    @comment.post_id = @post_id
    @comment.body = params[:comment][:body]
    @post = Post.find(@post_id)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post_id), notice: '投稿しました'
    else
      render 'comments/new', alert: '投稿できませんでした'
    end
  end
end
