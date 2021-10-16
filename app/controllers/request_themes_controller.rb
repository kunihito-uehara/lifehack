class RequestThemesController < ApplicationController
  before_action :set_request_theme, only: [:show, :edit, :update, :destroy]

  def index
    @request_themes = RequestTheme.all
  end

  def show
  end

  def new
    @request_theme = RequestTheme.new
  end

  def edit
  end

  def create
    @request_theme = RequestTheme.new(request_theme_params)

    if @request_theme.save
      redirect_to @request_theme
    else
      render :new
    end
  end

  def update
    if @request_theme.update(request_theme_params)
      redirect_to @request_theme, notice: '変更しました。'
    else
      render :edit
    end
  end

  def destroy
    @request_theme.destroy
    redirect_to request_themes_url, notice: '削除しました。'
  end

  private
    def set_request_theme
      @request_theme = RequestTheme.find(params[:id])
    end

    def request_theme_params
      params.require(:request_theme).permit(:name, :title)
    end
end
