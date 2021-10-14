class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end


  def create
    # @comment = @article.comments.build(comment_params)
    # @comment.user_id = current_user.id
    # respond_to do |format|
    #   if @comment.save
    #     format.js { render :index }
    #   else
    #     format.html { redirect_to article_path(@article), notice: '投稿を入力' }
    #   end
    # end
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: '投稿しました！'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'コメント編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: '削除しました！'
  end

  private
    # def set_article
    #   @article = Article.find(params[:article_id])
    # end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
