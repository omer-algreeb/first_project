require 'test_helper'

class UserMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_message = user_messages(:one)
  end

  test "should get index" do
    get user_messages_url, as: :json
    assert_response :success
  end

  test "should create user_message" do
    assert_difference('UserMessage.count') do
      post user_messages_url, params: { user_message: { message_id: @user_message.message_id, user_id: @user_message.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_message" do
    get user_message_url(@user_message), as: :json
    assert_response :success
  end

  test "should update user_message" do
    patch user_message_url(@user_message), params: { user_message: { message_id: @user_message.message_id, user_id: @user_message.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_message" do
    assert_difference('UserMessage.count', -1) do
      delete user_message_url(@user_message), as: :json
    end

    assert_response 204
  end
end
