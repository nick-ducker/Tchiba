class CartsController < ApplicationController
  before_action :authenticate

  def show
    @cartitems = current_user.cart.cart_items
  end

  def update_quantity
  end

  def remove_item
  end

  def checkout
  end
end
