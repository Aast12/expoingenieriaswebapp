require "application_system_test_case"

class DaysgroupsTest < ApplicationSystemTestCase
  setup do
    @daysgroup = daysgroups(:one)
  end

  test "visiting the index" do
    visit daysgroups_url
    assert_selector "h1", text: "Daysgroups"
  end

  test "creating a Daysgroup" do
    visit daysgroups_url
    click_on "New Daysgroup"

    fill_in "Day", with: @daysgroup.day
    fill_in "Group", with: @daysgroup.group
    click_on "Create Daysgroup"

    assert_text "Daysgroup was successfully created"
    click_on "Back"
  end

  test "updating a Daysgroup" do
    visit daysgroups_url
    click_on "Edit", match: :first

    fill_in "Day", with: @daysgroup.day
    fill_in "Group", with: @daysgroup.group
    click_on "Update Daysgroup"

    assert_text "Daysgroup was successfully updated"
    click_on "Back"
  end

  test "destroying a Daysgroup" do
    visit daysgroups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daysgroup was successfully destroyed"
  end
end
