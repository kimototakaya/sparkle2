class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :set_post
  def index
    @posts = Post.all
  end

  def new
    if @post.new
      redirect_to new_post
    end
  end

  def create
    binding.pry
    @post = Post.new
    @post = Post.save(@post.id)
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