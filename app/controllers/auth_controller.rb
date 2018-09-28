class AuthController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:auth][:email])
	  if user && user.authenticate(params[:auth][:password])
	    session[:user_id] = user.id
      if user.role == "patient"
        redirect_to search_path
      else
        redirect_to root_path
      end
	  else
      redirect_to login_path
	  end 
  end

  def destroy 
	  reset_session
	  redirect_to login_path 
  end
end
