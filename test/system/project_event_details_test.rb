require "application_system_test_case"

class ProjectEventDetailsTest < ApplicationSystemTestCase
  setup do
    @project_event_detail = project_event_details(:one)
  end

  test "visiting the index" do
    visit project_event_details_url
    assert_selector "h1", text: "Project Event Details"
  end

  test "creating a Project event detail" do
    visit project_event_details_url
    click_on "New Project Event Detail"

    fill_in "Final score", with: @project_event_detail.final_score
    fill_in "Project", with: @project_event_detail.project_id
    fill_in "Stand", with: @project_event_detail.stand
    click_on "Create Project event detail"

    assert_text "Project event detail was successfully created"
    click_on "Back"
  end

  test "updating a Project event detail" do
    visit project_event_details_url
    click_on "Edit", match: :first

    fill_in "Final score", with: @project_event_detail.final_score
    fill_in "Project", with: @project_event_detail.project_id
    fill_in "Stand", with: @project_event_detail.stand
    click_on "Update Project event detail"

    assert_text "Project event detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Project event detail" do
    visit project_event_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project event detail was successfully destroyed"
  end
end
