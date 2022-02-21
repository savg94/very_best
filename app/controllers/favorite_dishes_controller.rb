class FavoriteDishesController < ApplicationController
  before_action :set_favorite_dish, only: [:show, :edit, :update, :destroy]

  # GET /favorite_dishes
  def index
    @favorite_dishes = FavoriteDish.all
  end

  # GET /favorite_dishes/1
  def show
  end

  # GET /favorite_dishes/new
  def new
    @favorite_dish = FavoriteDish.new
  end

  # GET /favorite_dishes/1/edit
  def edit
  end

  # POST /favorite_dishes
  def create
    @favorite_dish = FavoriteDish.new(favorite_dish_params)

    if @favorite_dish.save
      message = 'FavoriteDish was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @favorite_dish, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /favorite_dishes/1
  def update
    if @favorite_dish.update(favorite_dish_params)
      redirect_to @favorite_dish, notice: 'Favorite dish was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorite_dishes/1
  def destroy
    @favorite_dish.destroy
    message = "FavoriteDish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to favorite_dishes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_dish
      @favorite_dish = FavoriteDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_dish_params
      params.require(:favorite_dish).permit(:user_id, :venue_id, :dish_id)
    end
end
