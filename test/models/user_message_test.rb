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

require 'test_helper'

class UserMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
