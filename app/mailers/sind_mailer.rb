class SindMailer < ApplicationMailer
  default from: 'omer@jisr.net'
 
  def welcome_email(email, data)
    @email = email
    @data = data
    mail(to: email, subject: "The report of the end of the week.")
  end
end
