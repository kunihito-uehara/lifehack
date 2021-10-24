class ArticlesController < ApplicationController
  # before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).order(id: "DESC").page(params[:page]).per(20) 

  end

  def new
    @article = Article.new
    # if @article.user != current_user
    #   redirect_to articles_path, alert: "不正なアクセスです。"
    # end
  end
  
  def create
    @article = current_user.articles.build(article_params) 
    if @article.save
      redirect_to articles_path, notice: "#{@article.title}をUP"
    else
      render :new 
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      unless current_user.admin?
      redirect_to articles_path, alert: "不正なアクセスです。"
      end
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "#{@article.title}更新"    
    else
      render :edit
    end
  end

  def show 
    @article = Article.find(params[:id])
    @comment = Comment.new
    @favorite = current_user&.favorites&.find_by(article_id: @article.id)
    @comments = @article.comments.order(created_at: :desc)

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "#{@article.title}削除！"
  end
  
  def top
  end

  private

  def article_params
    params.require(:article).permit(:title, :user_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
