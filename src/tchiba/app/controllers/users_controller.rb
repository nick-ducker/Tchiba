class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :reviewhistory, :ordertransactionhistory]

  def show
    #private
    @user = current_user
  end

  def profile
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "That user doesn't exist"
      redirect_to root_path
    end
  end

  def reviewhistory
    #private
    @reviews = current_user.reviews
  end

  def ordertransactionhistory
    #private
    orders = current_user.orders

    @buyerorders = Array.new
    @sellerorders = Array.new
    orders.each do |order|
      if order.seller == current_user.id
        @sellerorders << order
      else
        @buyerorders << order
      end

    @buyertransactions = buyerorders.transactions
    @sellertransactions = sellerorders.transactions
  end

  private
end
