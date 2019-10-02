class Message < ApplicationRecord
  has_many :user_messages, dependent: :nullify
  has_many :users, through: :user_messages

  belongs_to :type_message
  has_many :attachments, dependent: :nullify

  scope :sorted, lambda { order(id: :desc) }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where("name LIKE ?", "%#{query}%")}

end
