require "application_system_test_case"

class ProjectDetailsTest < ApplicationSystemTestCase
  setup do
    @project_detail = project_details(:one)
  end

  test "visiting the index" do
    visit project_details_url
    assert_selector "h1", text: "Project Details"
  end

  test "creating a Project detail" do
    visit project_details_url
    click_on "New Project Detail"

    fill_in "Client type", with: @project_detail.client_type
    fill_in "Description", with: @project_detail.description
    fill_in "Name", with: @project_detail.name
    fill_in "Project", with: @project_detail.project_id
    check "Semestre i" if @project_detail.semestre_i
    check "Social impact" if @project_detail.social_impact
    fill_in "Video url", with: @project_detail.video_url
    click_on "Create Project detail"

    assert_text "Project detail was successfully created"
    click_on "Back"
  end

  test "updating a Project detail" do
    visit project_details_url
    click_on "Edit", match: :first

    fill_in "Client type", with: @project_detail.client_type
    fill_in "Description", with: @project_detail.description
    fill_in "Name", with: @project_detail.name
    fill_in "Project", with: @project_detail.project_id
    check "Semestre i" if @project_detail.semestre_i
    check "Social impact" if @project_detail.social_impact
    fill_in "Video url", with: @project_detail.video_url
    click_on "Update Project detail"

    assert_text "Project detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Project detail" do
    visit project_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project detail was successfully destroyed"
  end
end
