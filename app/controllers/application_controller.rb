class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可する
  #before_action :authenticate_user!
  
  #deviseにおけるストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #deviseでログイン機能実装後に、ログイン後の遷移先を指定
    articles_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon,:like_hack])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon,:like_hack])
  end
end