class CartsController < ApplicationController
  before_action :authenticate

  def show
    @cartitems = current_user.cart.cart_items
    n = 0
    @cartitems.each{|x| x.order ? n += 1 : nil}
    n == @cartitems.size ? (@notable = true) : (@notable = false)
  end

  def update_quantity
  end

  def remove_item
    cartitem = CartItem.find(params[:id])
    cartitem.destroy
    flash[:alert] = "Blend removed from cart"
    redirect_back(fallback_location: root_path)
  end

  def checkout
  end
end
