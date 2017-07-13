require 'test_helper'

class TimeRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_registration = time_registrations(:one)
  end

  test "should get index" do
    get time_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_time_registration_url
    assert_response :success
  end

  test "should create time_registration" do
    assert_difference('TimeRegistration.count') do
      post time_registrations_url, params: { time_registration: {  } }
    end

    assert_redirected_to time_registration_url(TimeRegistration.last)
  end

  test "should show time_registration" do
    get time_registration_url(@time_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_registration_url(@time_registration)
    assert_response :success
  end

  test "should update time_registration" do
    patch time_registration_url(@time_registration), params: { time_registration: {  } }
    assert_redirected_to time_registration_url(@time_registration)
  end

  test "should destroy time_registration" do
    assert_difference('TimeRegistration.count', -1) do
      delete time_registration_url(@time_registration)
    end

    assert_redirected_to time_registrations_url
  end
end
