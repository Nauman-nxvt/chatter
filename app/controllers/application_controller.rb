class ApplicationController < ActionController::Base
  before_action :auth
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :auth

  private

  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      @current_user
    elsif session[:user_id] && User.find(session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      session.delete(:user_id)
      nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def auth
    if logged_in?
      session[:accesses]+=1
    else
      redirect_to root_url, flash: {danger: 'You must login to access Chat'}
    end
  end
end
