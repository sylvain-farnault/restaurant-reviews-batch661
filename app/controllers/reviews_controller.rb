class ReviewsController < ApplicationController

  # GET 'restaurants/:restaurant_id/reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST 'restaurants/:restaurant_id/reviews'
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  # DELETE 'reviews/:id'
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.restaurant
    # redirect_to restaurant_path(@review.restaurant)
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
