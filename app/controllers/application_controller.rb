class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id]).name
    elsif session[:userid]
      @current_user = Userfb.find(session[:userid]).name
    else
      @current_user= nil
    end
  end
  
  helper_method :current_user
end
