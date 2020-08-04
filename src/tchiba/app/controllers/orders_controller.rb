class OrdersController < ApplicationController
  def new
  end

  def create
    @cartitem = CartItem.find(params[:id])
    @cartitem.create_order(
      buyer_id: current_user.id,
      seller_id: @cartitem.blend.user.id,
      gross: @cartitem.gross_price,
      discount: @cartitem.total_discount,
      total: @cartitem.total_amount
    )
    redirect_to @cartitem.order
  end

  def show
  end

  def update
  end

  def destroy
  end
end
