class Emailer < ActionMailer::Base
  default from: "from@example.com"
   def contact(recipient, subject, message, sent_at = Time.now)
      mail(:to => "kendhia@gmail.com", :sender => recipient, :subject => subject, :content => message)
   end
end