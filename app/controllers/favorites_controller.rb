class FavoritesController < ApplicationController
  # before_action :set_article
  # before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り解除しました"
  end
end



# def create
#   if @article.user_id != current_user.id   # 投稿者本人以外に限定
#     @favorite = Favorite.create(user_id: current_user.id, article_id: @article.id)
#   end
# end
# def destroy
#   @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id)
#   @favorite.destroy
# end

# private
# def set_article
#   @article = Article.find(params[:article_id])
# end
