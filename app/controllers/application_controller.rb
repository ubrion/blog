class ApplicationController < ActionController::Base
  def authorize
    redirect_to new_sessions_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
