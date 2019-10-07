class UserMailer < ApplicationMailer
  default from: 'omer@click.net'
 
  def welcome_email(user)
    @user = user
    debugger
    #path = Rails.root.join('public/filename.jpg')
    #attachments['filename.jpg'] = File.read(path)
    mail(to: @user.email, subject: "Adding Conet sacsessfle.")
  end
end
