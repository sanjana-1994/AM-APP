class AppointmentsController < ApplicationController
	def index
	    @new_appointment = Appointment.new
  	end

	def create
		@params = Hash.new
		@params[:doctor_id] = params[:doctor_id]
		@params[:patient_id] = session[:patient_id]
		@year = params[:appointment]["appointment_date(1i)"]
		@month = params[:appointment]["appointment_date(2i)"]
		@day = params[:appointment]["appointment_date(3i)"]
		@hour = params[:appointment]["appointment_date(4i)"]
		@minutes = params[:appointment]["appointment_date(5i)"]
		@params[:appointment_date] = DateTime.new(@year.to_i, @month.to_i, @day.to_i, @hour.to_i, @minutes.to_i, 0)
		@appointment = Appointment.new(@params)
	    if @appointment.save
	       redirect_to root_path
	    end
	end
end
