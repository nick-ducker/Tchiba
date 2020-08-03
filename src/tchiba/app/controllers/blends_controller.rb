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
    @blend = Blend.find(params[:id])
  end

  def edit
    @blend = Blend.find(params[:id])
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    flash[:alert] = "Image removed"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    blend = Blend.find(params[:id])
    blend.destroy
    flash[:alert] = "Blend deleted."
    redirect_to root_path
  end

  def update
    @blend = Blend.find(params[:id])
    if @blend.update(strong_blend_params)
      redirect_to blend_path(@blend)
    else
      flash[:alert] = "Could not update blend"
      render 'edit'
    end
  end

private

  def strong_blend_params
    params.require(:blend).permit(:name, :price, :shipping_cost, :discount_amount, :quantity, :descrip, :weight, property_ids: [], image: [])
  end

end
