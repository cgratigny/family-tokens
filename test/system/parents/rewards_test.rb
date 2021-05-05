require "application_system_test_case"

class Parents::RewardsTest < ApplicationSystemTestCase
  setup do
    @parents_reward = parents_rewards(:one)
  end

  test "visiting the index" do
    visit parents_rewards_url
    assert_selector "h1", text: "Parents/Rewards"
  end

  test "creating a Reward" do
    visit parents_rewards_url
    click_on "New Parents/Reward"

    click_on "Create Reward"

    assert_text "Reward was successfully created"
    click_on "Back"
  end

  test "updating a Reward" do
    visit parents_rewards_url
    click_on "Edit", match: :first

    click_on "Update Reward"

    assert_text "Reward was successfully updated"
    click_on "Back"
  end

  test "destroying a Reward" do
    visit parents_rewards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reward was successfully destroyed"
  end
end
