class PagesController < ApplicationController
  def home
    @doctors = Doctor.order(created_at: :desc).all
    @patients = Patient.order(created_at: :desc).all
  end

  def search
  	if params[:name]
  		@doctors = Doctor.where('name LIKE ?', "%#{params[:name]}%")
  	else
  		@doctors = Doctor.all
  	end
  end
end
