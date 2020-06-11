require "application_system_test_case"

class StaffMembersTest < ApplicationSystemTestCase
  setup do
    @staff_member = staff_members(:one)
  end

  test "visiting the index" do
    visit staff_members_url
    assert_selector "h1", text: "Staff Members"
  end

  test "creating a Staff member" do
    visit staff_members_url
    click_on "New Staff Member"

    click_on "Create Staff member"

    assert_text "Staff member was successfully created"
    click_on "Back"
  end

  test "updating a Staff member" do
    visit staff_members_url
    click_on "Edit", match: :first

    click_on "Update Staff member"

    assert_text "Staff member was successfully updated"
    click_on "Back"
  end

  test "destroying a Staff member" do
    visit staff_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Staff member was successfully destroyed"
  end
end
