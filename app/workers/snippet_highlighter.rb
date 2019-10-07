class SnippetHighlighter
  @queue = :snippet_queue
  def self.perform(snippet_id)
    
    user_admin = UserAdmin.find(snippet_id)
    UserMailer.welcome_email(user_admin).deliver_now
  end
end