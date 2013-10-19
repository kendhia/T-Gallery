class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@youdomain.dev"
  default :to => "kendhia@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Kendhia: #{message.subject}")
  end

end