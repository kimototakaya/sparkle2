class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :set_post
  def index
    post = Post.all
    @posts = post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create
    if @post.save
    else
      render :new
    end
  end

  def show
    @post = Post.all
  end

  private

  def post_params
    params.require(:post).parmit(:content, :title, :image).merge(user_id current_user.id)
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