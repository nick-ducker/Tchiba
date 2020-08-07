class ApplicationController < ActionController::Base

  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate 
    unless current_user
      flash[:alert] = "You must be logged in to do this"
      redirect_back(fallback_location: root_path)
    end
  end

  def check_for_cart
    if current_user
      unless current_user.cart
        current_user.create_cart
        cart_count
      end
    end
  end

  def cart_count
      count = 0
      unless current_user.cart.cart_items.empty?
      current_user.cart.cart_items.each do |cart_item|
        count += cart_item.blend_quantity
        session[:count] = count
      end
    else 
      session[:count] = 0
    end
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :bio, :profilepic])
  end

end
