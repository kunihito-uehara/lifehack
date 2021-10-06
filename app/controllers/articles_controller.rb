class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "記事「#{@article.title}」を登録しました！"
    else
      render :new 
    end
  end
  
  def edit
  end
  
  def update
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

  def set_article
    @article = Article.find(params[:id])
  end

end
