require "test_helper"

class FamilyCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_code = family_codes(:one)
  end

  test "should get index" do
    get family_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_family_code_url
    assert_response :success
  end

  test "should create family_code" do
    assert_difference('FamilyCode.count') do
      post family_codes_url, params: { family_code: {  } }
    end

    assert_redirected_to family_code_url(FamilyCode.last)
  end

  test "should show family_code" do
    get family_code_url(@family_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_code_url(@family_code)
    assert_response :success
  end

  test "should update family_code" do
    patch family_code_url(@family_code), params: { family_code: {  } }
    assert_redirected_to family_code_url(@family_code)
  end

  test "should destroy family_code" do
    assert_difference('FamilyCode.count', -1) do
      delete family_code_url(@family_code)
    end

    assert_redirected_to family_codes_url
  end
end
