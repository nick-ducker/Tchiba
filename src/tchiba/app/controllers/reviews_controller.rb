class ReviewsController < ApplicationController
  before_action :authenticate, except: [:show]
  before_action :set_review, only: [:show, :destroy]
  
  def new
    #find the blend using the blend_id sent through in the parameters
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
    #finds the blend attached the particular review.
    blend = @review.blend
    @review.destroy
    blend.update(totalrating: blend.aggregate_ratings)
    redirect_to blend_path(blend)
  end

private

  def strong_blend_params
    params.require(:review).permit(:user_id, :blend_id, :descrip, :rating)
  end

  def set_review
    #finds the review using the sent through ID in parameters
    @review = Review.find(params[:id])
  end

end
