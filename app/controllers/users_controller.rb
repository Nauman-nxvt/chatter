class UsersController < ApplicationController

  def login
    redirect_to messages_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to messages_path
    else
      render :login
    end
  end

  def log_out
    current_user.destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :dialect)
  end
end