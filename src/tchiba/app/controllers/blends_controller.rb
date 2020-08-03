class BlendsController < ApplicationController
  def create
  end

  def new
    if current_user
      @blend = Blend.new
    else
      flash[:alert] = "You must create an account to do this."
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
