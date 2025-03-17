class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_login
    unless @current_user
      flash[:alert] = "Please login to view this page."
      redirect_to "/login"
    end
  end

end
