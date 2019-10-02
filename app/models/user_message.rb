# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  message_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserMessage < ApplicationRecord
  belongs_to :user
  belongs_to :message
end
