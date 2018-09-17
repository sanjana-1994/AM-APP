class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user 

  def current_user 
  	@current_user ||= Patient.find(session[:patient_id]) if session[:patient_id] 
  end

  def require_user 
  	redirect_to '/login' unless current_user 
  end

  def logged_in_user 
  	redirect_to root_path unless !(current_user) 
  end

  def require_admin 
    redirect_to root_path unless (current_user.admin?)
  end

end
