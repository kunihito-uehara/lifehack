class ArticlesController < ApplicationController
  # before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.build(article_params) 
    if @article.save
      redirect_to articles_path, notice: "記事「#{@article.title}」を登録しました！"
    else
      render :new 
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "記事「#{@article.title}」を更新しました！"    
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "記事「#{@article.title}」を削除しました！"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, :image, :image_cache)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
