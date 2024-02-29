require "test_helper"

class UserRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_registrations_new_url
    assert_response :success
  end

  test "should get index" do
    get user_registrations_index_url
    assert_response :success
  end

  test "should get show" do
    get user_registrations_show_url
    assert_response :success
  end
end
