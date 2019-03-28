class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to new_user_path
  end

  def show
    @user = User.find(params[:id])
  end

  def secret
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to new_session_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
