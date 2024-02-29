require "test_helper"

class Rails::UserProfile::Rooms::RoomsRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rails_user_profile_rooms_rooms_registrations_index_url
    assert_response :success
  end

  test "should get show" do
    get rails_user_profile_rooms_rooms_registrations_show_url
    assert_response :success
  end

  test "should get create" do
    get rails_user_profile_rooms_rooms_registrations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get rails_user_profile_rooms_rooms_registrations_destroy_url
    assert_response :success
  end
end
