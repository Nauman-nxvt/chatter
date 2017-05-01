class UsersController < ApplicationController
  skip_before_filter :auth
  rescue_from ActionController::InvalidAuthenticityToken, with: :redirect_to_login_page

  def redirect_to_login_page
    flash[:danger] = 'Try again'
    redirect_to(root_path)
  end

  def login
    redirect_to messages_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      ActiveRecord::SessionStore::Session.where(session_id: session.id).first.update_attribute(:user_id, @user.id)
      session[:accesses] = 1
      redirect_to messages_path, flash: {user_id: @user.id}
    else
      render :login
    end
  end

  def log_out
    user_id = current_user.id
    current_user.destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path, flash: {user_id: user_id}
  end

  private
  def user_params
    params.require(:user).permit(:username, :dialect)
  end
end