class AppointmentsController < ApplicationController
	def index
	    @new_appointment = Appointment.new
  	end

	def create
		my_params = Hash.new
		my_params[:doctor_id] = params[:doctor_id]
		my_params[:user_id] = session[:user_id]
		year = params[:appointment]["appointment_date(1i)"]
		month = params[:appointment]["appointment_date(2i)"]
	    day = params[:appointment]["appointment_date(3i)"]
		hour = params[:appointment]["appointment_date(4i)"]
		minutes = params[:appointment]["appointment_date(5i)"]
		my_params[:appointment_date] = DateTime.new(year.to_i, month.to_i, day.to_i, hour.to_i, minutes.to_i, 0)
		appointment = Appointment.new(my_params)
		appointment.status = "pending"
	    if appointment.save
	       redirect_to search_path
	    end
	end

	def update
		appmt = Appointment.find(params[:id])
        appmt.status = "Confirmed"
        if appmt.save
          UserMailer.with(appointment: appmt).appointment_confirm_email.deliver_now
        end
	end
end
