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
    @comment = Comment.find(params[:id])
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメント編集'
      format.js { render :edit }
    end
  end


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save!
        flash.now[:notice] = '投稿しました！'
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice:'投稿失敗' }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    redirect_to article_path(@article) if @comment.update(comment_params)

    # @comment = @article.comments.find(params[:id])
    # respond_to do |format|
    #   if @comment.update(comment_params)
    #     flash.now[:notice] = '編集されました'
    #     format.js { render :index }
    #   else
    #     flash.now[:notice] = '編集に失敗しました'
    #     format.js { render :edit_error }
    #   end
    # end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        flash.now[:notice] = '削除！'
        format.js { render :index }
  #   respond_to do |format|
    #     format.js { render :index }
      end
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :_articleid, :user_id)
      # params.require(:comment).permit(:content)
    end
end
