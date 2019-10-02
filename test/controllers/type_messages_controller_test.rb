require 'test_helper'

class TypeMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_message = type_messages(:one)
  end

  test "should get index" do
    get type_messages_url, as: :json
    assert_response :success
  end

  test "should create type_message" do
    assert_difference('TypeMessage.count') do
      post type_messages_url, params: { type_message: { name: @type_message.name } }, as: :json
    end

    assert_response 201
  end

  test "should show type_message" do
    get type_message_url(@type_message), as: :json
    assert_response :success
  end

  test "should update type_message" do
    patch type_message_url(@type_message), params: { type_message: { name: @type_message.name } }, as: :json
    assert_response 200
  end

  test "should destroy type_message" do
    assert_difference('TypeMessage.count', -1) do
      delete type_message_url(@type_message), as: :json
    end

    assert_response 204
  end
end
