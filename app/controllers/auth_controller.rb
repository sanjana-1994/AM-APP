class AuthController < ApplicationController
  def new
  end

  def create
    patient = Patient.find_by_email(params[:auth][:email])
	  if patient && patient.authenticate(params[:auth][:password])
	    session[:patient_id] = patient.id
      if patient.role == "patient"
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
