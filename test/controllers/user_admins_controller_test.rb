require 'test_helper'

class UserAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_admin = user_admins(:one)
  end

  test "should get index" do
    get user_admins_url, as: :json
    assert_response :success
  end

  test "should create user_admin" do
    assert_difference('UserAdmin.count') do
      post user_admins_url, params: { user_admin: { email: @user_admin.email, job_id: @user_admin.job_id, name: @user_admin.name, password: @user_admin.password, phone: @user_admin.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show user_admin" do
    get user_admin_url(@user_admin), as: :json
    assert_response :success
  end

  test "should update user_admin" do
    patch user_admin_url(@user_admin), params: { user_admin: { email: @user_admin.email, job_id: @user_admin.job_id, name: @user_admin.name, password: @user_admin.password, phone: @user_admin.phone } }, as: :json
    assert_response 200
  end

  test "should destroy user_admin" do
    assert_difference('UserAdmin.count', -1) do
      delete user_admin_url(@user_admin), as: :json
    end

    assert_response 204
  end
end
