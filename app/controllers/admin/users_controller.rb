class Admin::UsersController < ApplicationController
   before_action :require_admin

  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end


  def preview_mode
    session[:user_id] = params[:id].to_i
    redirect_to movies_path
  end

   protected
  def require_admin
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    elsif !session[:actual_id] 
      flash[:alert] = "You are not an administrator!"
      redirect_to root_path
    end
  end

end
