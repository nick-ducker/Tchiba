class CartsController < ApplicationController
  before_action :authenticate
  before_action :set_cart_item, only: [:update_quantity, :remove_item]
  after_action :cart_count, only: [:update_quantity, :add_item, :remove_item]

  def show
    #Find cart items for a particular user by using the devise current_user method to pull the current user. 
    #Authentication ensures this action will only be accessed by a logged in user
    @cartitems = current_user.cart.cart_items
  end

  def update_quantity
    @cartitem.update(strong_cart_params)
    flash[:alert] = "Quantity updated"
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    #Checks the cart item to see if it has an order attached to it
    if @cartitem.order
      flash[:alert] = "You must cancel your order before you can remove this item from your cart"
      redirect_to order_path(@cartitem.order)
    else
      @cartitem.destroy
      flash[:alert] = "Blend removed from cart"
      redirect_back(fallback_location: root_path)
    end
  end

  def add_item
    #Checks the current users cart items to see if they already have a cart item for the blend they're trying to add to their cart.
    if current_user.cart.cart_items.find_by(blend_id: strong_cart_params[:blend_id])
      flash[:alert] = "You already have this item in your cart"
      redirect_back(fallback_location: root_path)
    else
      current_user.cart.cart_items.create(strong_cart_params)
      flash[:alert] = "Blend added to cart"
      redirect_back(fallback_location: root_path)
    end
  end

private

  def strong_cart_params
    params.require(:cart_item).permit(:blend_quantity, :blend_id)
  end

  def set_cart_item
    #Find the cart item using the send through parameter ID
    @cartitem = CartItem.find(params[:id])
  end

end
