class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :reviewhistory, :ordertransactionhistory, :calculate_credit]
  before_action :current_user_set, only: [:profile, :show, :calculate_credit]
  
  def show
  end

  def calculate_credit
    @user.update(credit: @user.calculate_credit)
    flash[:alert] = "Credit Calculated!!"
    redirect_to account_path
  end

  def profile
    if @user == nil
      flash[:alert] = "That user doesn't exist"
      redirect_to root_path
    end
    #loads blends attached to a particular user
    if @user.blends
    @pagyblends, @blends = pagy(@user.blends, items: 6)
    end

    if @user.reviews
    #loads reviews attached to a particular user
    @pagy, @reviews = pagy(@user.reviews, items: 8)
    end
  end

  def reviewhistory
    #loads reviews attached to the current user
    @pagy, @reviews = pagy(current_user.reviews, items: 10)
  end

  def ordertransactionhistory
    #loads buying and selling orders attached to a current user
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

  def current_user_set
    #pass the current user into a instance variable
    @user = current_user
  end
end
