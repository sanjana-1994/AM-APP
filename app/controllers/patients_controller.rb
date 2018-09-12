class PatientsController < ApplicationController
  def index
    @new_patient = Patient.new
    @patients = Patient.order(created_at: :desc).all
  end
  
  def create
    @patient = Patient.new(post_params)
    if @patient.save
       redirect_to root_path
    end
  end
  private
  def post_params
    params.require(:patient).permit()
  end 

end
