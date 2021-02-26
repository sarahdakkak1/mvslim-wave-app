class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all
          # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
    end

  def search
    # write a search for boxes and store in instance variable
    @restaurants = Restaurant.search(params[:query], where: {restaunt_id: params[:restaurant][:id]})
    # write a search for items and store in instance variable
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

   def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

    def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'restaurants deleted successfully'
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :opening, photos: [])
  end
end
