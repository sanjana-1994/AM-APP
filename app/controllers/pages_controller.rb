require 'json'
class PagesController < ApplicationController
  before_action :require_user, only: [:search, :home]
  before_action :require_admin, only: [:home]
  
  def getAppointments
    appointments = Appointment.order(created_at: :desc).joins(:doctor).joins(:user).all
    hash_response = {:data => appointments}
    render :json => hash_response.to_json(:include=>[:doctor, :user])
  end

  def home
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
