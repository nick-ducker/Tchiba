class CartsController < ApplicationController
  before_action :authenticate
  before_action :set_cart_item, only: [:update_quantity, :remove_item]
  after_action :cart_count, only: [:update_quantity, :add_item, :remove_item]

  def show
    @cartitems = current_user.cart.cart_items
  end

  def update_quantity
    @cartitem.update(strong_cart_params)
    flash[:alert] = "Quantity updated"
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    if @cartitem.order
      flash[:alert] = "You must cancel your order before you can remove this item from your cart"
      redirect_to order_path(@cartitem.order) and return
    end
    @cartitem.destroy
    flash[:alert] = "Blend removed from cart"
    redirect_back(fallback_location: root_path)
  end

  def add_item
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
    @cartitem = CartItem.find(params[:id])
  end

end
