require "test_helper"

class Parents::RedemptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parents_redemption = parents_redemptions(:one)
  end

  test "should get index" do
    get parents_redemptions_url
    assert_response :success
  end

  test "should get new" do
    get new_parents_redemption_url
    assert_response :success
  end

  test "should create parents_redemption" do
    assert_difference('Parents::Redemption.count') do
      post parents_redemptions_url, params: { parents_redemption: {  } }
    end

    assert_redirected_to parents_redemption_url(Parents::Redemption.last)
  end

  test "should show parents_redemption" do
    get parents_redemption_url(@parents_redemption)
    assert_response :success
  end

  test "should get edit" do
    get edit_parents_redemption_url(@parents_redemption)
    assert_response :success
  end

  test "should update parents_redemption" do
    patch parents_redemption_url(@parents_redemption), params: { parents_redemption: {  } }
    assert_redirected_to parents_redemption_url(@parents_redemption)
  end

  test "should destroy parents_redemption" do
    assert_difference('Parents::Redemption.count', -1) do
      delete parents_redemption_url(@parents_redemption)
    end

    assert_redirected_to parents_redemptions_url
  end
end
