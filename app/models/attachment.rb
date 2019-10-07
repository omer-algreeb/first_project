# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  message_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attachment < ApplicationRecord
  belongs_to :message
  has_many_attached :attachment

  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  validates_attachment_size         :attachment, less_than: 20.megabytes

  scope :sorted, lambda { order(id: :desc) }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where("name LIKE ?", "%#{query}%")}

end
