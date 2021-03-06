class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  def create

    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
