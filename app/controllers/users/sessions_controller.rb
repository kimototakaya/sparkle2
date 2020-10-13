# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    if user = User.create 
      # binding.pry
      redirect_to root_path(current_user), notice: "ログインしました"
    else
      redirect_to root_path, alert: "ログインに失敗しました"
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: "ログアウトしました"
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
