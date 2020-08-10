class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  before_action :authenticate, only: [:create, :show, :successful_payment, :failed_payment, :destroy, :update]
  before_action :cart_count, only: [:show]
  before_action :set_order, only: [:show, :update, :destroy]
  
  def create
    #check the current user to see if they have an address attached to their account
    unless current_user.address 
      flash[:alert] = "You need to register an address before you can checkout"
      redirect_to edit_user_registration_path
    else
      #Find the cart item using the sent through parameter ID and create an order off of it
      @cartitem = CartItem.find(params[:id])
      @cartitem.create_order(
      blend_id: @cartitem.blend.id,
      buyer_id: current_user.id,
      seller_id: @cartitem.blend.user.id,
      gross: @cartitem.gross_price,
      discount: @cartitem.total_discount,
      total: @cartitem.total_amount
      )
      redirect_to @cartitem.order
    end
  end

  def show
    #Check the set order to see if it's been paid
    @paid = @order.paid
    #Load all the transactions connected to the set order.
    @transactions = @order.transactions

    # STRIPE PAYMENT SETUP
    unless @paid
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @order.cart_item.blend.name,
            description: @order.cart_item.blend.descrip,
            amount: (@order.total * 100).to_i,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                blend_id: @order.cart_item.blend.id,
                order_id: @order.id,
                cart_item_id: @order.cart_item.id
            }
        },
        success_url: "#{root_url}orders/#{@order.id}/successful_payment",
        cancel_url: "#{root_url}orders/#{@order.id}/failed_payment?amount=#{@order.total}"
      )

      @session_id = session.id
      ##############
    end
  end

  def successful_payment
    flash[:alert] = "Payment Successful"
    redirect_to order_path(params[:id])
  end

  def failed_payment
    Transaction.create(
      order_id: params[:id],
      amount: params[:amount],
      paid: false
    )
    flash[:alert] = "Payment Failed"
    redirect_to order_path(params[:id])
  end

  def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)

    amount = params[:data][:object][:amount_total]
    user_id = payment.metadata.user_id
    blend_id = payment.metadata.blend_id
    order_id = payment.metadata.order_id
    cart_item_id = payment.metadata.cart_item_id
    #Find an order using the order_id contained in the strip metadata
    order = Order.find(order_id)

    hooktrans = Transaction.new(
      order_id: order_id,
      amount: amount / 100,
      paid: true
    )

    hooktrans.save
    

    x = 0
    order.transactions.each do |trans|
      if trans.paid
        x += trans.amount
      end
    end
    x >= order.total ? (@paid = true) : (@paid = false)

    if @paid && order.paid == false
      order.update(paid: true, cart_item_id: nil)
      order.blend.update(quantity: (order.blend.quantity - order.blend.quantity))
      #find and destroy orders associated cart item if the order has been paid
      CartItem.find(cart_item_id).destroy
    end

    head 200
  end

  def update
    @order.update(shipped: true)
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy
    flash[:alert] = "Order Cancelled"
    redirect_to cart_show_path
  end

private

  def set_order
    #find an order by the send through parameter ID
    @order = Order.find(params[:id])
  end

end
