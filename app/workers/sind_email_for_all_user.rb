class SindEmailForAllUser
  @queue = :sind_email_queue
  def self.perform(text_data = 'data')
    debugger
    UserAdmin.pluck(:email).each { |email| SindMailer.welcome_email(email, text_data).deliver_now }
  end
end