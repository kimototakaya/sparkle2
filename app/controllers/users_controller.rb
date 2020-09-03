class UsersController < ApplicationController
  
  def new
    binding.pry
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path(user.id), notice:'登録が完了しました'
    else
      render 'devise/registrations/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
