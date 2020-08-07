class CartsController < ApplicationController
  before_action :authenticate
  before_action :set_cart_item, only: [:update_quantity, :remove_item]
  after_action :cart_count, only: [:update_quantity, :add_item, :remove_item]

  def show
    @cartitems = current_user.cart.cart_items
    n = 0
    @cartitems.each{|x| x.order ? n += 1 : nil}
    n == @cartitems.size ? (@notable = true) : (@notable = false)
  end

  def update_quantity
    @cartitem.update(strong_cart_params)
    flash[:alert] = "Quantity updated"
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    @cartitem.destroy
    flash[:alert] = "Blend removed from cart"
    redirect_back(fallback_location: root_path)
  end

  def add_item
    current_user.cart.cart_items.create(strong_cart_params)
    flash[:alert] = "Blend added to cart"
    redirect_back(fallback_location: root_path)
  end

private

  def strong_cart_params
    params.require(:cart_item).permit(:blend_quantity, :blend_id)
  end

  def set_cart_item
    @cartitem = CartItem.find(params[:id])
  end

end
