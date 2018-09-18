class AuthController < ApplicationController
  def new
  end

  def create
    patient = Patient.find_by_name(params[:auth][:name])
	if patient && patient.authenticate(params[:auth][:password])
	  session[:patient_id] = patient.id
      redirect_to root_path
	else
      redirect_to '/login'
	end 
  end

  def destroy 
	session[:patient_id] = nil 
	redirect_to '/login' 
  end
end
