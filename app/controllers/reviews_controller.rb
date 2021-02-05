class ReviewsController < ApplicationController
    def new
        @shop = Shop.find(params[:shop_id])
        @review = Review.new
    end

    def create
      @shop = Shop.find(params[:shop_id])
      @review = Review.new(review_params)
      @review.shop = @shop
      if @review.save!
        redirect_to shop_path(@shop)
      else
        render "reviews/new"
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content, photos: [])
    end
  end
  
