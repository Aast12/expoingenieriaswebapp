require "application_system_test_case"

class AcademicLevelsTest < ApplicationSystemTestCase
  setup do
    @academic_level = academic_levels(:one)
  end

  test "visiting the index" do
    visit academic_levels_url
    assert_selector "h1", text: "Academic Levels"
  end

  test "creating a Academic level" do
    visit academic_levels_url
    click_on "New Academic Level"

    fill_in "Name", with: @academic_level.name
    click_on "Create Academic level"

    assert_text "Academic level was successfully created"
    click_on "Back"
  end

  test "updating a Academic level" do
    visit academic_levels_url
    click_on "Edit", match: :first

    fill_in "Name", with: @academic_level.name
    click_on "Update Academic level"

    assert_text "Academic level was successfully updated"
    click_on "Back"
  end

  test "destroying a Academic level" do
    visit academic_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Academic level was successfully destroyed"
  end
end
