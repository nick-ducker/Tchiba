class ReviewsController < ApplicationController
  before_action :authenticate, except: [:show]
  
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

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

private

  def strong_blend_params
    params.require(:review).permit(:user_id, :blend_id, :descrip, :rating)
  end

end
