class ReviewsController < ApplicationController
  before_action :authenticate, except: [:show]
  before_action :set_review, only: [:show, :destroy]
  
  def new
    @blend = Blend.find(params[:blend_id])
    @review = Review.new
  end

  def create
    review = Review.new(strong_blend_params)
    if review.save
      review.blend.update(totalrating: review.blend.aggregate_ratings)
      redirect_to blend_path(review.blend)
    else
      flash[:alert] = "Could not create review"
      render 'new'
    end
  end

  def show
  end

  def destroy
    blend = Blend.find(@review.blend.id)
    @review.destroy
    blend.update(totalrating: blend.aggregate_ratings)
    redirect_to blend_path(blend)
  end

private

  def strong_blend_params
    params.require(:review).permit(:user_id, :blend_id, :descrip, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
