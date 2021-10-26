class FavoritesController < ApplicationController
  # before_action :set_article
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  respond_to? :js
  def create
    Favorite.create(user_id: current_user.id, article_id: params[:article_id])
    @article = Article.find_by(id:params[:article_id])
    # favorite = current_user.favorites.create(article_id: params[:article_id])
    # redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
    @article = Article.find_by(id:params[:article_id])
    # favorite = current_user.favorites.find_by(article_id: params[:article_id]).destroy
    # redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り解除しました"
  end
  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end