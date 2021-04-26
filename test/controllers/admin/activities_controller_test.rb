require "test_helper"

class Admin::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_activity = admin_activities(:one)
  end

  test "should get index" do
    get admin_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_activity_url
    assert_response :success
  end

  test "should create admin_activity" do
    assert_difference('Admin::Activity.count') do
      post admin_activities_url, params: { admin_activity: {  } }
    end

    assert_redirected_to admin_activity_url(Admin::Activity.last)
  end

  test "should show admin_activity" do
    get admin_activity_url(@admin_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_activity_url(@admin_activity)
    assert_response :success
  end

  test "should update admin_activity" do
    patch admin_activity_url(@admin_activity), params: { admin_activity: {  } }
    assert_redirected_to admin_activity_url(@admin_activity)
  end

  test "should destroy admin_activity" do
    assert_difference('Admin::Activity.count', -1) do
      delete admin_activity_url(@admin_activity)
    end

    assert_redirected_to admin_activities_url
  end
end
