class ReviewsController < ApplicationController
  def create
    product = Product.find_by_id(params[:product_id])
    review = Review.new(
      product: product,
      user: current_user,
      description: review_params[:description],
      rating: review_params[:rating]
    )
    if review.save
      redirect_to '/', notice: 'review is saved'
    else
      puts review.errors.full_messages
      redirect_to '/login', notice: 'review is not saved'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
