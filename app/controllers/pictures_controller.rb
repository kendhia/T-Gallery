class PicturesController < ApplicationController

  def new
    @page_title = "Upload"
    if session[:user_id]
      if User.find(session[:user_id])
        @picture = Picture.new
      else
        redirect_to '/log_in'
      end
    elsif session[:userid]
      if Userfb.find(session[:userid])
        @picture = Picture.new
      else
        redirect_to '/log_in'
      end
    else
      redirect_to '/log_in'
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
    @name = Picture.find(params[:id]).name
    @description = Picture.find(params[:id]).description
    if session[:user_id]
      @user = User.find(session[:user_id]).name
      @date = User.find(session[:user_id]).created_at
    end
    if  session[:userid]
      @user = Userfb.find(session[:userid]).name
      @date = Userfb.find(session[:userid]).created_at
      @picture.userid =  Digest::MD5::hexdigest(Userfb.find(session[:userid]).email).downcase
    end
  end
  
  def create
    @picture = Picture.new(params[:picture])
    if session[:user_id]
      @picture.userid =  Digest::MD5::hexdigest(User.find(session[:user_id]).email).downcase
    end
    if  session[:userid]
      @picture.userid =  Digest::MD5::hexdigest(Userfb.find(session[:userid]).email).downcase
    end
    if @picture.save
      redirect_to @picture
    else
      redirect_to root_url, :notice => "Image uploaded!"
    end
  end
 
end
