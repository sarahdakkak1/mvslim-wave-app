class ReviewsController < ApplicationController
    def new
        @shop = Shop.find(params[:shop_id])
        @review = Review.new
    end

    def create
        @restaurant = Shop.find params[:shop_id]
        @review = @shop.reviews.build_with_user(review_params, current_user)
        if @review.save
            redirect_to shops_path
        else
            if @review.errors[:user]
                # Note: if you have correctly disabled the review button where appropriate,
                # this should never happen...
                redirect_to shops_path, alert: 'You have already reviewed this shop'
            else
                # Why would we render new again?  What else could cause an error?
                render :new
            end
        end
    end

    private

    def review_params
        params.require(:review).permit(:thoughts, :rating)
    end
end
