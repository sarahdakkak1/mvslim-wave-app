class BusinessesController < ApplicationController
  def search
    @businesses = Business.all

    @restaurant = Restaurant.search(params[:query], where: {restaurant_id: params[:restauranr][:id]})
    @shops = Shop.search(params[:query], where: {shop_id: params[:shop][:id]})

  end
end
