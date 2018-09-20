class UserMailer < ApplicationMailer
  default from: 'sanjana.das@pramata.com'	
  def appointment_confirm_email
  	@appointment = params[:appointment]
  	puts @appointment.patient.email
    mail(to: @appointment.patient.email, subject: 'Appointment Confirmed')
  end
end
