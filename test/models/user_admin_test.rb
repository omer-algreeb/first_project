# == Schema Information
#
# Table name: user_admins
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  phone           :string
#  password_digest :string
#  job_id          :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
