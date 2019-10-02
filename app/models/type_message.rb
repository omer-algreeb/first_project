class TypeMessage < ApplicationRecord
  has_many :messages, dependent: :nullify

  scope :sorted, lambda { order(id: :desc) }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where("name LIKE ?", "%#{query}%")}
end
