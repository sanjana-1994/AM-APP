
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def new
    new_user = User.new
    render template: new_user_path, locals: {new_user: new_user}
  end
  
  def create
    params = post_params
    user = User.new(params)
    if user.save
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        if params[:role]=="patient"
          redirect_to search_path
        else
          redirect_to root_path
        end
      end
    else
      redirect_to login_path
    end
  end

  private
  def post_params
    params.require(:user).permit(:name, :password, :birth_date, :gender, :role, :email)
  end 

end
