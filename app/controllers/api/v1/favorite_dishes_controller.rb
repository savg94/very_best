class Api::V1::FavoriteDishesController < Api::V1::GraphitiController
  def index
    favorite_dishes = FavoriteDishResource.all(params)
    respond_with(favorite_dishes)
  end

  def show
    favorite_dish = FavoriteDishResource.find(params)
    respond_with(favorite_dish)
  end

  def create
    favorite_dish = FavoriteDishResource.build(params)

    if favorite_dish.save
      render jsonapi: favorite_dish, status: :created
    else
      render jsonapi_errors: favorite_dish
    end
  end

  def update
    favorite_dish = FavoriteDishResource.find(params)

    if favorite_dish.update_attributes
      render jsonapi: favorite_dish
    else
      render jsonapi_errors: favorite_dish
    end
  end

  def destroy
    favorite_dish = FavoriteDishResource.find(params)

    if favorite_dish.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: favorite_dish
    end
  end
end
