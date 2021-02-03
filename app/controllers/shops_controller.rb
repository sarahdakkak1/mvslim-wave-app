class ShopsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @shops = Shop.all
  end

  def search
    # write a search for boxes and store in instance variable
    @shops = Shop.search(params[:query], where: {shop_id: params[:shop][:id]})
    # write a search for items and store in instance variable
  end

  def top
    @shops = Shop.where(stars: 5)

    # by default this is rendering app/views/shops/top.html.erb
    # but... we cna override this default behaviour
    # and tell rails exactly which view to render
    render "index"
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    shop.save

    redirect_to shop_path(shop)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)

    redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy

    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :stars)
  end

end
