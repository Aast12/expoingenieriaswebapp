require "application_system_test_case"

class JudgeEvaluationsTest < ApplicationSystemTestCase
  setup do
    @judge_evaluation = judge_evaluations(:one)
  end

  test "visiting the index" do
    visit judge_evaluations_url
    assert_selector "h1", text: "Judge Evaluations"
  end

  test "creating a Judge evaluation" do
    visit judge_evaluations_url
    click_on "New Judge Evaluation"

    fill_in "Judge", with: @judge_evaluation.judge_id
    fill_in "Project", with: @judge_evaluation.project_id
    fill_in "Score", with: @judge_evaluation.score
    click_on "Create Judge evaluation"

    assert_text "Judge evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Judge evaluation" do
    visit judge_evaluations_url
    click_on "Edit", match: :first

    fill_in "Judge", with: @judge_evaluation.judge_id
    fill_in "Project", with: @judge_evaluation.project_id
    fill_in "Score", with: @judge_evaluation.score
    click_on "Update Judge evaluation"

    assert_text "Judge evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Judge evaluation" do
    visit judge_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Judge evaluation was successfully destroyed"
  end
end
