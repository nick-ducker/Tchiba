class ApplicationController < ActionController::Base

  def authenticate 
    unless current_user
      flash[:alert] = "You must be logged in to view this page"
      redirect_back(fallback_location: root_path)
    end
  end

end
