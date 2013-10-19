class UsersController < ApplicationController
  
  def index
    @page_title = "Gallery"
    @users = User.all(:limit => 10)
  end
  
  def show
    @page_title = "My Gallery"
    if session[:user_id]
      user_id = session[:user_id]
      @user = User.find(user_id).name
      @email = User.find(user_id).email
      @pictures = Picture.find_all_by_userid(Digest::MD5::hexdigest(User.find(user_id).email).downcase)
    elsif session[:userid]
      user_id = session[:userid]
      @user = Userfb.find(user_id).name
      @email = Userfb.find(user_id).email
      @pictures = Picture.find_all_by_userid(Digest::MD5::hexdigest(Userfb.find(user_id).email).downcase)
    else
      redirect_to '/log_in'
    end
  end

  def new
    @page_title = "Signup"
    if session[:user_id] or session[:userid]
      if User.find(session[:user_id]) or Userfb.find(session[:user_id])
        redirect_to root_url, :notice => "This user alreaddy exist!"
      else
        @user = User.new
      end
    else
        @user = User.new
    end
  end
  
  
  def createfb
    user = Userfb.from_omniauth(env["omniauth.auth"])
    session[:userid] = user.id
    redirect_to root_url, :notice => "Congrats! you're a membre in our community :D"
    
  end

  def create 
    @user = User.create(params[:user])
    if @user.save
      redirect_to @user
    else
      render "new"
    end    
  end
end
