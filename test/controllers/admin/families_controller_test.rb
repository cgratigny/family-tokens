require "test_helper"

class Admin::FamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family = admin_families(:one)
  end

  test "should get index" do
    get admin_families_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_family_url
    assert_response :success
  end

  test "should create admin_family" do
    assert_difference('Admin::Family.count') do
      post admin_families_url, params: { admin_family: {  } }
    end

    assert_redirected_to admin_family_url(Admin::Family.last)
  end

  test "should show admin_family" do
    get admin_family_url(@family)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_family_url(@family)
    assert_response :success
  end

  test "should update admin_family" do
    patch admin_family_url(@family), params: { admin_family: {  } }
    assert_redirected_to admin_family_url(@family)
  end

  test "should destroy admin_family" do
    assert_difference('Admin::Family.count', -1) do
      delete admin_family_url(@family)
    end

    assert_redirected_to admin_families_url
  end
end
