class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user && @user = User.find_by(id: params[:id])
      @user
    elsif @user
      redirect_to login_path
    else
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
