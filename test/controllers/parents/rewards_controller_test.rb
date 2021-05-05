require "test_helper"

class Parents::RewardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parents_reward = parents_rewards(:one)
  end

  test "should get index" do
    get parents_rewards_url
    assert_response :success
  end

  test "should get new" do
    get new_parents_reward_url
    assert_response :success
  end

  test "should create parents_reward" do
    assert_difference('Parents::Reward.count') do
      post parents_rewards_url, params: { parents_reward: {  } }
    end

    assert_redirected_to parents_reward_url(Parents::Reward.last)
  end

  test "should show parents_reward" do
    get parents_reward_url(@parents_reward)
    assert_response :success
  end

  test "should get edit" do
    get edit_parents_reward_url(@parents_reward)
    assert_response :success
  end

  test "should update parents_reward" do
    patch parents_reward_url(@parents_reward), params: { parents_reward: {  } }
    assert_redirected_to parents_reward_url(@parents_reward)
  end

  test "should destroy parents_reward" do
    assert_difference('Parents::Reward.count', -1) do
      delete parents_reward_url(@parents_reward)
    end

    assert_redirected_to parents_rewards_url
  end
end
