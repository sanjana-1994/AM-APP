class UserMailer < ApplicationMailer
  default from: 'sanjana.das@pramata.com'	
  def appointment_confirm_email
  	@appointment = params[:appointment]
    mail(to: @appointment.user.email, subject: 'Appointment Confirmed')
  end
end
