class RecommendationsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @recommendation = Recommendation.new
    end

    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @recommendation = Recommendation.new(recommendation_params)
      @recommendation.restaurant = @restaurant
      if @recommendation.save!
        redirect_to restaurant_path(@restaurant)
      else
        render "recommendations/new"
      end
    end

    private

    def recommendation_params
      params.require(:recommendation).permit(:content, :stars, photos: [])
    end
end
