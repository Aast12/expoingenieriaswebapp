require "application_system_test_case"

class SocialImpactsTest < ApplicationSystemTestCase
  setup do
    @social_impact = social_impacts(:one)
  end

  test "visiting the index" do
    visit social_impacts_url
    assert_selector "h1", text: "Social Impacts"
  end

  test "creating a Social impact" do
    visit social_impacts_url
    click_on "New Social Impact"

    fill_in "Empathy", with: @social_impact.empathy
    fill_in "Problem", with: @social_impact.problem
    fill_in "Project", with: @social_impact.project_id
    fill_in "Responsibility", with: @social_impact.responsibility
    click_on "Create Social impact"

    assert_text "Social impact was successfully created"
    click_on "Back"
  end

  test "updating a Social impact" do
    visit social_impacts_url
    click_on "Edit", match: :first

    fill_in "Empathy", with: @social_impact.empathy
    fill_in "Problem", with: @social_impact.problem
    fill_in "Project", with: @social_impact.project_id
    fill_in "Responsibility", with: @social_impact.responsibility
    click_on "Update Social impact"

    assert_text "Social impact was successfully updated"
    click_on "Back"
  end

  test "destroying a Social impact" do
    visit social_impacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social impact was successfully destroyed"
  end
end
