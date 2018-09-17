class DoctorsController < ApplicationController
  before_action :require_admin
  def index
    @new_doctor = Doctor.new
    @doctors = Doctor.order(created_at: :desc).all
  end

  def create
    @post_params = post_params
    @post_params[:doctor_image] = @post_params[:doctor_image].original_filename
    @doctor = Doctor.new(@post_params)
    if @doctor.save
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:doctor).permit(:name, :doctor_type, :specialization, :qualification, :years_of_exp, :rating, :total_ratings, :doctor_image)
  end
 
end
