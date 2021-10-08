class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update ]

  def index
    @users= User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィール更新しました。"
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :icon, :like_hack)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
