class PagesController < ApplicationController
  before_action :require_admin, only: [:home]
  before_action :require_user, only: [:search]

  def home
    appointments = Appointment.order(created_at: :desc).all
    render 'home', locals: {appointments: appointments}
  end

  def search
  	if params[:search]
      @doctors = Doctor.where('name LIKE ?', "%#{params[:search]}%")
                       .or(Doctor.where('specialization LIKE ?', "%#{params[:search]}%"))
                       .or(Doctor.where('doctor_type LIKE ?', "%#{params[:search]}%"))
  	else
  		@doctors = Doctor.all
  	end
  end
end
