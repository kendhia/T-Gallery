class SessionsController < ApplicationController
  def new
    if session[:user_id] or session[:userid]
      redirect_to root_url
    end
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Loged in"
    else
      redirect_to '/sign_up'
    end   
  end
  
  def destroy
    session[:user_id] = nil
    session[:userid] = nil
    redirect_to root_url, :notice => "Loged out"
  end
end
