class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:uploader, :favorites,
                                                   :comments, :tag, :readers, :fan_readers, :favoriters).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @favorite = Favorite.new
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)

    if @article.save
      message = "Article was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @article, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    message = "Article was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to articles_url, notice: message
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:link, :uploader_review, :uploader_id,
                                    :publication, :estimated_reading_time, :tag_id)
  end
end
