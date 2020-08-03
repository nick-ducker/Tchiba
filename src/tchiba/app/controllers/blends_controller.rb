class BlendsController < ApplicationController
  before_action :authenticate, only: [:create, :edit, :destroy, :update]

  def create
    if current_user.blends.create(strong_blend_params)
      redirect_to current_user.blends.last
    else
      flash[:alert] = "Could not create blend"
      render 'new'
    end
  end

  def new
    if current_user
      @blend = Blend.new
    else
      flash[:alert] = "You must create an account to do this."
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

private

  def strong_blend_params
    params.require(:blend).permit(:name, :price, :shipping_cost, :discount_amount, :quantity, :descrip, :weight, :images)
  end

end
