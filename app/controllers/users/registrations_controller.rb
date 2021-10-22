# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def destroy
    if @user.email == 'guest@example.com'
      redirect_to user_path(@user), alert: "ゲストユーザーは削除できません。"
    elsif @user.admin == true
      redirect_to user_path(@user), alert: "管理者は削除できません。"
    else
      @user.destroy
      redirect_to new_user_registration_path, notice: "退会しました"
    end
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource 名前も追加したい
  def create
    if  params[:user][:email].blank? &&  params[:user][:password].blank?
      flash.now[:alert] = "Email と パスワードを入力して下さい"
    else
      if  params[:user][:email].blank?
        flash.now[:alert] = "Email を入力して下さい"
      end
      if  params[:user][:password].blank?
        flash.now[:alert] = "パスワードを入力して下さい"
      end
    end
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
