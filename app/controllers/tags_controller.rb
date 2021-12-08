class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(distinct: true).includes(:articles).page(params[:page]).per(10)
  end

  def show
    @article = Article.new
  end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: "Tag was successfully created."
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: "Tag was successfully destroyed."
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:tag)
  end
end
