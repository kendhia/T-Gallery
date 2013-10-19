class HomeController < ApplicationController   
  
  def index
    @page_title = 'Home page'
    @pictures ||= Picture.all()
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @user = @current_user.email
    elsif session[:userid]
      @current_user = Userfb.find(session[:userid])  
      @user = @current_user.name
    else
      @current_user= nil
    end
  end
    
end
