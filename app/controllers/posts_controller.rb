class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :set_post
  PER = 8

  def index
    post = Post.page(params[:post]).per(PER)
    @posts = post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment = @post.comments.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :image)
  end

  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end