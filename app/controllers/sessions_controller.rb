class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:login][:username])
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
