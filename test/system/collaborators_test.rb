require "application_system_test_case"

class CollaboratorsTest < ApplicationSystemTestCase
  setup do
    @collaborator = collaborators(:one)
  end

  test "visiting the index" do
    visit collaborators_url
    assert_selector "h1", text: "Collaborators"
  end

  test "creating a Collaborator" do
    visit collaborators_url
    click_on "New Collaborator"

    fill_in "Email", with: @collaborator.email
    fill_in "First name", with: @collaborator.first_name
    fill_in "Last name", with: @collaborator.last_name
    fill_in "Major", with: @collaborator.major
    fill_in "Project", with: @collaborator.project_id
    fill_in "Student code", with: @collaborator.student_code
    click_on "Create Collaborator"

    assert_text "Collaborator was successfully created"
    click_on "Back"
  end

  test "updating a Collaborator" do
    visit collaborators_url
    click_on "Edit", match: :first

    fill_in "Email", with: @collaborator.email
    fill_in "First name", with: @collaborator.first_name
    fill_in "Last name", with: @collaborator.last_name
    fill_in "Major", with: @collaborator.major
    fill_in "Project", with: @collaborator.project_id
    fill_in "Student code", with: @collaborator.student_code
    click_on "Update Collaborator"

    assert_text "Collaborator was successfully updated"
    click_on "Back"
  end

  test "destroying a Collaborator" do
    visit collaborators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collaborator was successfully destroyed"
  end
end
