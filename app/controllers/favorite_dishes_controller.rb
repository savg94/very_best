class FavoriteDishesController < ApplicationController
  before_action :set_favorite_dish, only: %i[show edit update destroy]

  def index
    @q = FavoriteDish.ransack(params[:q])
    @favorite_dishes = @q.result(distinct: true).includes(:venue, :dish,
                                                          :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @favorite_dish = FavoriteDish.new
  end

  def edit; end

  def create
    @favorite_dish = FavoriteDish.new(favorite_dish_params)

    if @favorite_dish.save
      message = "FavoriteDish was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @favorite_dish, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @favorite_dish.update(favorite_dish_params)
      redirect_to @favorite_dish,
                  notice: "Favorite dish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @favorite_dish.destroy
    message = "FavoriteDish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to favorite_dishes_url, notice: message
    end
  end

  private

  def set_favorite_dish
    @favorite_dish = FavoriteDish.find(params[:id])
  end

  def favorite_dish_params
    params.require(:favorite_dish).permit(:user_id, :venue_id, :dish_id)
  end
end
