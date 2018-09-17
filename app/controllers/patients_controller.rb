class PatientsController < ApplicationController
  before_action :logged_in_user
  def index
    @new_patient = Patient.new
    @patients = Patient.order(created_at: :desc).all
  end
  
  def create
    @params = post_params
    @params[:image_loc] = @params[:image_loc].original_filename
    @params[:medical_report_loc] = @params[:medical_report_loc].original_filename
    @patient = Patient.new(@params)
    if @patient.save
      redirect_to search_path
    else
      redirect_to root_path
    end
  end
  private
  def post_params
    params.require(:patient).permit(:name, :password, :birth_date, :image_loc, :medical_report_loc, :age, :gender, :role)
  end 

end
