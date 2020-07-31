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
  end

  def ordertransactionhistory
    #private
  end

  private
end
