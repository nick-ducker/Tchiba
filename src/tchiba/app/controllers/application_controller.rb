class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  def authenticate 
    unless current_user
      flash[:alert] = "You must be logged in to view this page"
      redirect_back(fallback_location: root_path)
    end
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :bio])
  end

end
