require "application_system_test_case"

class CommitteeEvaluationsTest < ApplicationSystemTestCase
  setup do
    @committee_evaluation = committee_evaluations(:one)
  end

  test "visiting the index" do
    visit committee_evaluations_url
    assert_selector "h1", text: "Committee Evaluations"
  end

  test "creating a Committee evaluation" do
    visit committee_evaluations_url
    click_on "New Committee Evaluation"

    fill_in "Description", with: @committee_evaluation.description
    fill_in "Feasibility", with: @committee_evaluation.feasibility
    fill_in "Impact", with: @committee_evaluation.impact
    fill_in "Methodology", with: @committee_evaluation.methodology
    fill_in "Problem", with: @committee_evaluation.problem
    fill_in "Project", with: @committee_evaluation.project_id
    fill_in "Results", with: @committee_evaluation.results
    fill_in "Score", with: @committee_evaluation.score
    click_on "Create Committee evaluation"

    assert_text "Committee evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Committee evaluation" do
    visit committee_evaluations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @committee_evaluation.description
    fill_in "Feasibility", with: @committee_evaluation.feasibility
    fill_in "Impact", with: @committee_evaluation.impact
    fill_in "Methodology", with: @committee_evaluation.methodology
    fill_in "Problem", with: @committee_evaluation.problem
    fill_in "Project", with: @committee_evaluation.project_id
    fill_in "Results", with: @committee_evaluation.results
    fill_in "Score", with: @committee_evaluation.score
    click_on "Update Committee evaluation"

    assert_text "Committee evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Committee evaluation" do
    visit committee_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Committee evaluation was successfully destroyed"
  end
end
