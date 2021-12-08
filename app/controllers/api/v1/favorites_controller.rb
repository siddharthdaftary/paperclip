class Api::V1::FavoritesController < Api::V1::GraphitiController
  def index
    favorites = FavoriteResource.all(params)
    respond_with(favorites)
  end

  def show
    favorite = FavoriteResource.find(params)
    respond_with(favorite)
  end

  def create
    favorite = FavoriteResource.build(params)

    if favorite.save
      render jsonapi: favorite, status: 201
    else
      render jsonapi_errors: favorite
    end
  end

  def update
    favorite = FavoriteResource.find(params)

    if favorite.update_attributes
      render jsonapi: favorite
    else
      render jsonapi_errors: favorite
    end
  end

  def destroy
    favorite = FavoriteResource.find(params)

    if favorite.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: favorite
    end
  end
end
