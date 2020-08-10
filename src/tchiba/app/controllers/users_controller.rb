class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :reviewhistory, :ordertransactionhistory, :calculate_credit]
  before_action :current_user_set, only: [:show, :calculate_credit]
  
  def show
  end

  def calculate_credit
    @user.update(credit: @user.calculate_credit)
    redirect_to account_path
  end

  def profile
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "That user doesn't exist"
      redirect_to root_path
    end

    @pagyblends, @blends = pagy(@user.blends)
    @pagy, @reviews = pagy(@user.reviews)
  end

  def reviewhistory
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

  def current_user_set
    @user = current_user
  end
end
