class UsersController < ApplicationController
  def new
  end

  def show
    if current_user && @user = User.find_by(id: params[:id])
      @user
    elsif @user
      #redirect_to login_path
    else
      redirect_to create_account_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Account creation unsuccessful: #{@user.errors}"
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:email)
  end
end
