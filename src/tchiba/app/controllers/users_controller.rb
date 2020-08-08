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

    @blends = @user.blends
    pp @blends
    @reviews = @user.reviews
  end

  def reviewhistory
    #private
    @pagy, @reviews = pagy(current_user.reviews)
  end

  def ordertransactionhistory

    @buyerorders = current_user.buyer_orders
    @sellerorders = current_user.seller_orders

    @buyertransactions = Array.new
    @buyerorders.each do |order|
      order.transactions.each do |transact|
        @buyertransactions << transact
      end
    end
   
    @sellertransactions = Array.new
    @sellerorders.each do |order|
      order.transactions.each do |transact|
        @sellertransactions << transact
      end
    end

  end

  private
end
