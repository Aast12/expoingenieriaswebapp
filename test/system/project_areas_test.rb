require "application_system_test_case"

class ProjectAreasTest < ApplicationSystemTestCase
  setup do
    @project_area = project_areas(:one)
  end

  test "visiting the index" do
    visit project_areas_url
    assert_selector "h1", text: "Project Areas"
  end

  test "creating a Project area" do
    visit project_areas_url
    click_on "New Project Area"

    fill_in "Name", with: @project_area.name
    click_on "Create Project area"

    assert_text "Project area was successfully created"
    click_on "Back"
  end

  test "updating a Project area" do
    visit project_areas_url
    click_on "Edit", match: :first

    fill_in "Name", with: @project_area.name
    click_on "Update Project area"

    assert_text "Project area was successfully updated"
    click_on "Back"
  end

  test "destroying a Project area" do
    visit project_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project area was successfully destroyed"
  end
end
