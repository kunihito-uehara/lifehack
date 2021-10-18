class ArticlesController < ApplicationController
  # before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
    # @articles = Article.all.order(id: "DESC")
    @articles = Article.all.page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end
  
  def create #管理人権限
    @article = current_user.articles.build(article_params) 
    if @article.save
      redirect_to articles_path, notice: "#{@article.title}をUP"
    else
      render :new 
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    # if @article.user != current_user
    #   redirect_to recipes_path, alert: "不正なアクセスです。"
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "#{@article.title}更新"    
    else
      render :edit
    end
  end

  def show #ユーザーがshow画面で投稿（ajax）する
    @article = Article.find(params[:id])
    @comment = Comment.new
    @favorite = current_user.favorites.find_by(article_id: @article.id)
    @comments = @article.comments.order(created_at: :desc)

  end

  def destroy #管理人権限
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "#{@article.title}削除！"
  end
  
  def top
  end
  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, :image, :image_cache)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
