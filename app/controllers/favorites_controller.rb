class FavoritesController < ApplicationController
  before_action :current_user_must_be_favorite_favoriter, only: [:edit, :update, :destroy] 

  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(:distinct => true).includes(:favoriter, :article).page(params[:page]).per(10)
  end

  # GET /favorites/1
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      message = 'Favorite was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @favorite, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @favorite.update(favorite_params)
      redirect_to @favorite, notice: 'Favorite was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
    message = "Favorite was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to favorites_url, notice: message
    end
  end


  private

  def current_user_must_be_favorite_favoriter
    set_favorite
    unless current_user == @favorite.favoriter
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_params
      params.require(:favorite).permit(:favoriter_id, :article_id)
    end
end
