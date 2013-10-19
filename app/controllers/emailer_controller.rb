class EmailerController < ApplicationController

  def index
  end   
  
  def sendmail
    email = params[:email]
    recipient = email["recipient"]
    subject = email["subject"]
    message = email["message"]
    Emailer.contact(recipient, subject, message).deliver
    return if request.xhr?
    render :text => 'Message sent successfully'
 end
end

