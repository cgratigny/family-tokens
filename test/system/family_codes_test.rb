require "application_system_test_case"

class FamilyCodesTest < ApplicationSystemTestCase
  setup do
    @family_code = family_codes(:one)
  end

  test "visiting the index" do
    visit family_codes_url
    assert_selector "h1", text: "Family Codes"
  end

  test "creating a Family code" do
    visit family_codes_url
    click_on "New Family Code"

    click_on "Create Family code"

    assert_text "Family code was successfully created"
    click_on "Back"
  end

  test "updating a Family code" do
    visit family_codes_url
    click_on "Edit", match: :first

    click_on "Update Family code"

    assert_text "Family code was successfully updated"
    click_on "Back"
  end

  test "destroying a Family code" do
    visit family_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family code was successfully destroyed"
  end
end
