class UserAdmin < ApplicationRecord
  has_secure_password
  belongs_to :job

  has_many :user_messages, dependent: :nullify
  has_many :messages, through: :user_messages
  

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, numericality: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :password, length: { in: 6..20 }



  scope :sorted, lambda { order(id: :desc) }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where("name LIKE ?", "%#{query}%")}

end
