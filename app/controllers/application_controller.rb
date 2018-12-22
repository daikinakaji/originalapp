class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  # include SessionsHelper
  helper_method :current_user, :logged_in?
  
  def log_in(user)
    session[:user_id] = user.id    #code
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
