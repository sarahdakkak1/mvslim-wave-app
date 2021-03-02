class RestaurantsController < ApplicationController

  def index
    # search condition
    # the `geocoded` scope filters only restaurants with coordinates (latitude & longitude)
    @restaurants = Restaurant.all

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url('https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg')
      }
    end
  end

  def search
    # write a search for boxes and store in instance variable
    @restaurant = Restaurant.search(params[:query], where: {restauranr_id: params[:restauranr][:id]})
    # write a search for items and store in instance variable
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


  def build_geojson
    {
      type: "FeatureCollection",
      features: @restaurants.map(&:to_feature)
    }
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description,:latitude, :longitude, :opening, photos: [])
  end
end
