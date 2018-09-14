class SessionsController < ApplicationController
	def new
	end

	def create
		@patient = Patient.find_by_name(params[:session][:name])
		if @patient && @patient.authenticate(params[:session][:password])
			session[:patient_id] = @patient.id
    		redirect_to '/'
		else
		    redirect_to '/login'
		end 
	end
	def destroy 
		session[:patient_id] = nil 
		redirect_to '/login' 
	end
end
