class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path(@user.id), notice:'登録が完了しました'
    else
      render 'devise/registrations/new'
  end
end
