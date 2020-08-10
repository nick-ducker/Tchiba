class BlendsController < ApplicationController
  before_action :authenticate, only: [:create, :edit, :destroy, :update, :new]
  before_action :set_blend, only: [:show, :edit, :destroy, :update]

  def create
    if current_user.blends.create(strong_blend_params)
      redirect_to current_user.blends.last
    else
      flash[:alert] = "Could not create blend"
      render 'new'
    end
  end

  def new
    @blend = Blend.new 
  end

  def show
    @pagy, @reviews = pagy(@blend.reviews, items: 10)
  end

  def edit
  end

  def delete_image
    #Finds a specific image by the sent parameter ID
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    flash[:alert] = "Image removed"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @blend.destroy
    flash[:alert] = "Blend deleted."
    redirect_to root_path
  end

  def update
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

  def set_blend
    #Finds the blend according to the parameter ID
    @blend = Blend.find(params[:id])
  end

end
