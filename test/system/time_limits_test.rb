require "application_system_test_case"

class TimeLimitsTest < ApplicationSystemTestCase
  setup do
    @time_limit = time_limits(:one)
  end

  test "visiting the index" do
    visit time_limits_url
    assert_selector "h1", text: "Time Limits"
  end

  test "creating a Time limit" do
    visit time_limits_url
    click_on "New Time Limit"

    fill_in "Edition", with: @time_limit.edition_id
    fill_in "End date", with: @time_limit.end_date
    fill_in "Phase name", with: @time_limit.phase_name
    fill_in "Start date", with: @time_limit.start_date
    click_on "Create Time limit"

    assert_text "Time limit was successfully created"
    click_on "Back"
  end

  test "updating a Time limit" do
    visit time_limits_url
    click_on "Edit", match: :first

    fill_in "Edition", with: @time_limit.edition_id
    fill_in "End date", with: @time_limit.end_date
    fill_in "Phase name", with: @time_limit.phase_name
    fill_in "Start date", with: @time_limit.start_date
    click_on "Update Time limit"

    assert_text "Time limit was successfully updated"
    click_on "Back"
  end

  test "destroying a Time limit" do
    visit time_limits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time limit was successfully destroyed"
  end
end
