require "application_system_test_case"

class AbstractsTest < ApplicationSystemTestCase
  setup do
    @abstract = abstracts(:one)
  end

  test "visiting the index" do
    visit abstracts_url
    assert_selector "h1", text: "Abstracts"
  end

  test "creating a Abstract" do
    visit abstracts_url
    click_on "New Abstract"

    fill_in "Feasibility", with: @abstract.feasibility
    fill_in "Impact", with: @abstract.impact
    fill_in "Methodology", with: @abstract.methodology
    fill_in "Problem", with: @abstract.problem
    fill_in "Project", with: @abstract.project_id
    fill_in "Results", with: @abstract.results
    click_on "Create Abstract"

    assert_text "Abstract was successfully created"
    click_on "Back"
  end

  test "updating a Abstract" do
    visit abstracts_url
    click_on "Edit", match: :first

    fill_in "Feasibility", with: @abstract.feasibility
    fill_in "Impact", with: @abstract.impact
    fill_in "Methodology", with: @abstract.methodology
    fill_in "Problem", with: @abstract.problem
    fill_in "Project", with: @abstract.project_id
    fill_in "Results", with: @abstract.results
    click_on "Update Abstract"

    assert_text "Abstract was successfully updated"
    click_on "Back"
  end

  test "destroying a Abstract" do
    visit abstracts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Abstract was successfully destroyed"
  end
end
