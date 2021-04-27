require "application_system_test_case"

class Admin::FamiliesTest < ApplicationSystemTestCase
  setup do
    @family = admin_families(:one)
  end

  test "visiting the index" do
    visit admin_families_url
    assert_selector "h1", text: "Admin/Families"
  end

  test "creating a Family" do
    visit admin_families_url
    click_on "New Admin/Family"

    click_on "Create Family"

    assert_text "Family was successfully created"
    click_on "Back"
  end

  test "updating a Family" do
    visit admin_families_url
    click_on "Edit", match: :first

    click_on "Update Family"

    assert_text "Family was successfully updated"
    click_on "Back"
  end

  test "destroying a Family" do
    visit admin_families_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family was successfully destroyed"
  end
end
