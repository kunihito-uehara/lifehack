class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update ]

  # def index
  # end

  # def edit
  # end

  # def update
  # end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    favorites = Favorite.where(user_id: @user.id).pluck(:article_id)  # ログイン中のユーザーのお気に入りのarticle_idカラムを取得
    @favorite_list = Article.find(favorites)     
    # articlesテーブルから、お気に入り登録済みのレコードを取得
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :like_hack)
    #:email
  end

  def set_user
    @user = User.find(params[:id])
  end
end
