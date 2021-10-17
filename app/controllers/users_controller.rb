class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update ]

  # def index
  # end

  # def edit
  # end

  # def update
  # end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    @articles = @user.articles
    favorites = Favorite.where(user_id: current_user.id).pluck(:article_id)  # ログイン中のユーザーのお気に入りのarticle_idカラムを取得
    @favorite_list = Article.find(favorites)     # articlesテーブルから、お気に入り登録済みのレコードを取得
  end

  private

  def user_params
    params.require(:user).permit(:email, :icon, :like_hack)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
