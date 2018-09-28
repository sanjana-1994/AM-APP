  class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user 

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def require_user 
  	redirect_to login_path unless current_user 
  end

  def logged_in_user 
  	if current_user && !current_user.admin?
      redirect_to search_path
    elsif current_user && current_user.admin?
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def require_admin
    if current_user && !current_user.admin?
      redirect_to search_path
    elsif !current_user
      redirect_to login_path
    end
  end

end
