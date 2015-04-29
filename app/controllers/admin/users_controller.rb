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

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update_attributes(user_params)
  #     redirect_to admin_user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
  #   else
  #     render :new
  #   end
  # end


   protected
  def require_admin
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    elsif !current_user.administrator? 
      flash[:alert] = "You are not an administrator!"
      redirect_to root_path
    end
  end

  # def user_params
  #   params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  # end
end
