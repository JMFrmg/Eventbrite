class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :current_user

  protected


  def ensure_login
    return true if logged_in?
    session[:return_to] = request.fullpath
    redirect_to new_session_path and return false
  end

end
