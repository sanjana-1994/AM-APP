class PatientsController < ApplicationController
  before_action :logged_in_user

  def new
    new_patient = Patient.new
    render template: new_patient_path, locals: {new_patient: new_patient}
  end

  def index
    @patients = Patient.order(created_at: :desc).all
  end
  
  def create
    params = post_params
    patient = Patient.new(params)
    if patient.save
      patient = Patient.find_by_name(params[:name])
      if patient && patient.authenticate(params[:password])
        session[:patient_id] = patient.id
        if params[:role]=="patient"
          redirect_to search_path
        else
          redirect_to root_path
        end
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  private
  def post_params
    params.require(:patient).permit(:name, :password, :birth_date, :gender, :role, :email)
  end 

end
