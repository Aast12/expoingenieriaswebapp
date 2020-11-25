require "application_system_test_case"

class ProjectCategoriesTest < ApplicationSystemTestCase
  setup do
    @project_category = project_categories(:one)
  end

  test "visiting the index" do
    visit project_categories_url
    assert_selector "h1", text: "Project Categories"
  end

  test "creating a Project category" do
    visit project_categories_url
    click_on "New Project Category"

    fill_in "Name", with: @project_category.name
    click_on "Create Project category"

    assert_text "Project category was successfully created"
    click_on "Back"
  end

  test "updating a Project category" do
    visit project_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @project_category.name
    click_on "Update Project category"

    assert_text "Project category was successfully updated"
    click_on "Back"
  end

  test "destroying a Project category" do
    visit project_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project category was successfully destroyed"
  end
end
